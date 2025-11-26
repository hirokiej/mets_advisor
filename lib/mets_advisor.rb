# frozen_string_literal: true

require_relative "mets_advisor/version"
require_relative 'mets_advisor/activity'
require_relative 'mets_advisor/mets'
require_relative 'mets_advisor/result'
require_relative 'mets_advisor/i18n'
require_relative 'mets_advisor/selector'

module MetsAdvisor
  def self.run
    selector = Selector.new
    
    # 言語選択
    locale_choices = I18n.available_locales.values
    locale_index = selector.select(
      'Please select your language / 言語を選択してください:',
      locale_choices
    )
    locale_choice = I18n.available_locales.keys[locale_index]
    
    i18n = I18n.new(locale_choice)
    puts ''
    
    # アクティビティ入力
    activity = Activity.new(i18n, selector)
    activity.prompt

    # METs計算
    mets = Mets.new(
      activity.steps,
      activity.active_day,
      activity.activity_intensity,
      activity.activity_amount
    )

    # 結果表示
    puts ''
    result = Result.new(mets.total_mets, i18n)
    result.display
  end
end

# 実行
MetsAdvisor.run if __FILE__ == $PROGRAM_NAME
