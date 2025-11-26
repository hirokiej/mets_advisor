# frozen_string_literal: true

require "test_helper"

class TestConstants < Minitest::Test
  def test_daily_ideal_steps_constant
    assert_equal 8000, MetsAdvisor::DAILY_IDEAL_STEPS
  end

  def test_step_mets_constant
    assert_equal 3, MetsAdvisor::STEP_METS
  end

  def test_hourly_minutes_constant
    assert_equal 60, MetsAdvisor::HOURLY_MINUTES
  end

  def test_one_week_constant
    assert_equal 7, MetsAdvisor::ONE_WEEK
  end

  def test_weekly_ideal_mets_constant
    assert_equal 23, MetsAdvisor::WEEKLY_IDEAL_METS
  end

  def test_sufficient_mets_constant
    assert_equal 21, MetsAdvisor::SUFFICIENT_METS
  end

  def test_insufficient_mets_constant
    assert_equal 20, MetsAdvisor::INSUFFICIENT_METS
  end

  def test_walking_mets_constant
    assert_equal 4, MetsAdvisor::WALKING_METS
  end

  def test_running_mets_constant
    assert_equal 9, MetsAdvisor::RUNNING_METS
  end

  def test_mets_thresholds_are_in_correct_order
    assert MetsAdvisor::INSUFFICIENT_METS < MetsAdvisor::SUFFICIENT_METS
    assert MetsAdvisor::SUFFICIENT_METS < MetsAdvisor::WEEKLY_IDEAL_METS
  end

  def test_activity_mets_are_in_correct_order
    assert MetsAdvisor::STEP_METS < MetsAdvisor::WALKING_METS
    assert MetsAdvisor::WALKING_METS < MetsAdvisor::RUNNING_METS
  end
end
