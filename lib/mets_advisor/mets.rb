# frozen_string_literal: true

require_relative 'constants'

module MetsAdvisor
  class Mets
    attr_reader :step_mets, :weekly_mets, :total_mets

    def initialize(steps, active_day, activity_intensity, activity_amount)
      @step_mets = calc_step_mets(steps)
      @weekly_mets = calc_weekly_activity_mets(active_day, activity_intensity, activity_amount)
      @total_mets = (@step_mets + @weekly_mets).to_i
    end

    private

    def calc_step_mets(steps)
      weekly_steps = steps * ONE_WEEK
      ((weekly_steps.to_f / DAILY_IDEAL_STEPS) * STEP_METS).to_i
    end

    def calc_weekly_activity_mets(active_day, activity_intensity, activity_amount)
      activity_mets = (activity_amount.to_f / HOURLY_MINUTES) * activity_intensity
      active_day * activity_mets
    end
  end
end
