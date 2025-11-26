# frozen_string_literal: true

require_relative 'constants'
require_relative 'intensity_selector'
require_relative 'i18n'

module MetsAdvisor
  class Activity
    attr_reader :steps, :active_day, :activity_intensity, :activity_amount

    def initialize(i18n, selector)
      @i18n = i18n
      @selector = selector
      @steps = 0
      @active_day = 0
      @activity_intensity = 0
      @activity_amount = 0
    end

    def prompt
      @steps = input_daily_average_steps
      @active_day = input_active_days
      gather_activity_details
    end

    private

    def input_daily_average_steps
      @selector.ask(@i18n.t(:prompt_steps)) do |input|
        validate_proper_number(input)
      end
    end

    def input_active_days
      @selector.ask(@i18n.t(:prompt_active_days)) do |input|
        validate_active_day(input)
      end
    end

    def input_daily_activity_minutes
      @selector.ask(@i18n.t(:prompt_activity_minutes)) do |input|
        validate_proper_number(input)
      end
    end

    def gather_activity_details
      if @active_day.zero?
        @activity_intensity = 0
        @activity_amount = 0
        return
      end

      intensity_selector = IntensitySelector.new(@i18n, @selector)
      intensity = intensity_selector.select_activity_intensity
      @activity_intensity = intensity_selector.select_activity_levels(intensity)
      @activity_amount = input_daily_activity_minutes
    end

    def validate_proper_number(input)
      return @i18n.t(:error_empty) if input.strip.empty?
      return @i18n.t(:error_number) unless input.match?(/^\d+$/)
      true
    end

    def validate_active_day(input)
      return @i18n.t(:error_empty) if input.strip.empty?
      return @i18n.t(:error_number) unless input.match?(/^\d+$/)
      
      number = input.to_i
      return @i18n.t(:error_range) if number > ONE_WEEK || number < 0
      
      true
    end
  end
end
