# frozen_string_literal: true

require 'json'
require_relative 'constants'

module MetsAdvisor
  class Result
    def initialize(total_mets, i18n)
      @total_mets = total_mets
      @mets_shortage = WEEKLY_IDEAL_METS - @total_mets
      @i18n = i18n
    end

    def display
      if ideal_mets?
        display_ideal
      elsif sufficient_mets?
        display_sufficient
      elsif insufficient_mets?
        display_insufficient
      end
    end

    private

    def ideal_mets?
      @total_mets >= WEEKLY_IDEAL_METS
    end

    def sufficient_mets?
      @total_mets == SUFFICIENT_METS || @total_mets == SUFFICIENT_METS + 1
    end

    def insufficient_mets?
      @total_mets <= INSUFFICIENT_METS
    end

    def display_ideal
      puts @i18n.t(:ideal_title)
      puts @i18n.t(:separator)
      puts @i18n.t(:ideal_mets, total_mets: @total_mets)
      puts @i18n.t(:ideal_message)
    end

    def display_sufficient
      puts @i18n.t(:sufficient_title)
      puts @i18n.t(:separator)
      puts @i18n.t(:ideal_mets, total_mets: @total_mets)
      puts @i18n.t(:sufficient_shortage, mets_shortage: @mets_shortage)
      puts @i18n.t(:sufficient_suggestion)
      puts @i18n.t(:separator)
      suggest_required_exercise
    end

    def display_insufficient
      puts @i18n.t(:insufficient_title)
      puts @i18n.t(:separator)
      puts @i18n.t(:insufficient_shortage, mets_shortage: @mets_shortage)
      puts @i18n.t(:insufficient_message)
      puts @i18n.t(:insufficient_suggestion)
      puts @i18n.t(:separator)
      suggest_required_exercise
    end

    def calc_walking_minutes
      ((@mets_shortage.to_f / WALKING_METS) * HOURLY_MINUTES).to_i
    end

    def calc_running_minutes
      ((@mets_shortage.to_f / RUNNING_METS) * HOURLY_MINUTES).to_i
    end

    def suggest_required_exercise
      suggest_walking_minutes = calc_walking_minutes
      suggest_running_minutes = calc_running_minutes

      puts @i18n.t(:walking, 
                   minutes: suggest_walking_minutes, 
                   daily: suggest_walking_minutes / ONE_WEEK)
      puts @i18n.t(:running, 
                   minutes: suggest_running_minutes, 
                   daily: suggest_running_minutes / ONE_WEEK)
    end
  end
end
