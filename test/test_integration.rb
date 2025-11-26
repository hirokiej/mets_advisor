# frozen_string_literal: true

require "test_helper"

class TestIntegration < Minitest::Test
  def test_complete_workflow_ideal_case
    # 理想的なケース: 十分な歩数と運動
    i18n = MetsAdvisor::I18n.new('en')
    
    # Activity
    activity = create_activity_stub(steps: 8000, active_day: 5, intensity: 7.0, minutes: 45)
    
    # Mets calculation
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    # Result
    result = MetsAdvisor::Result.new(mets.total_mets, i18n)
    
    output = capture_io { result.display }.join
    
    assert mets.total_mets >= MetsAdvisor::WEEKLY_IDEAL_METS
    assert_match(/exceeds the ideal value/, output)
  end

  def test_complete_workflow_sufficient_case
    # 十分なケース: まあまあの歩数と運動
    i18n = MetsAdvisor::I18n.new('en')
    
    activity = create_activity_stub(steps: 6500, active_day: 3, intensity: 5.0, minutes: 40)
    
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    result = MetsAdvisor::Result.new(mets.total_mets, i18n)
    
    output = capture_io { result.display }.join
    
    assert_match(/Excellent! Keep up this level/, output)
  end

  def test_complete_workflow_insufficient_case
    # 不足ケース: 少ない歩数と運動なし
    i18n = MetsAdvisor::I18n.new('en')
    
    activity = create_activity_stub(steps: 3000, active_day: 0, intensity: 0, minutes: 0)
    
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    result = MetsAdvisor::Result.new(mets.total_mets, i18n)
    
    output = capture_io { result.display }.join
    
    assert mets.total_mets <= MetsAdvisor::INSUFFICIENT_METS
    assert_match(/not getting enough exercise/, output)
  end

  def test_complete_workflow_with_japanese_locale
    i18n = MetsAdvisor::I18n.new('ja')
    
    activity = create_activity_stub(steps: 10000, active_day: 5, intensity: 9.0, minutes: 30)
    
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    result = MetsAdvisor::Result.new(mets.total_mets, i18n)
    
    output = capture_io { result.display }.join
    
    assert_match(/理想値を上回っています/, output)
    assert_match(/METs/, output)
  end

  def test_edge_case_exactly_at_ideal_threshold
    i18n = MetsAdvisor::I18n.new('en')
    
    # Exactly 23 METs should be ideal
    result = MetsAdvisor::Result.new(23, i18n)
    output = capture_io { result.display }.join
    
    assert_match(/exceeds the ideal value/, output)
  end

  def test_edge_case_exactly_at_sufficient_threshold
    i18n = MetsAdvisor::I18n.new('en')
    
    # Exactly 21 METs should be sufficient
    result = MetsAdvisor::Result.new(21, i18n)
    output = capture_io { result.display }.join
    
    assert_match(/suitable for health maintenance/, output)
  end

  def test_edge_case_exactly_at_insufficient_threshold
    i18n = MetsAdvisor::I18n.new('en')
    
    # Exactly 20 METs should be insufficient
    result = MetsAdvisor::Result.new(20, i18n)
    output = capture_io { result.display }.join
    
    assert_match(/not getting enough exercise/, output)
  end

  def test_realistic_sedentary_lifestyle
    # 座りがちな生活: 2000歩/日、運動なし
    activity = create_activity_stub(steps: 2000, active_day: 0, intensity: 0, minutes: 0)
    
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    assert mets.total_mets < 10, "Sedentary lifestyle should have very low METs"
  end

  def test_realistic_active_lifestyle
    # アクティブな生活: 12000歩/日 + 週6日60分のサイクリング
    activity = create_activity_stub(steps: 12000, active_day: 6, intensity: 8.0, minutes: 60)
    
    mets = MetsAdvisor::Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )
    
    assert mets.total_mets > 40, "Very active lifestyle should have high METs"
  end

  private

  def create_activity_stub(steps:, active_day:, intensity:, minutes:)
    activity = Object.new
    activity.define_singleton_method(:steps) { steps }
    activity.define_singleton_method(:active_day) { active_day }
    activity.define_singleton_method(:activity_intensity) { intensity }
    activity.define_singleton_method(:activity_amount) { minutes }
    activity
  end
end
