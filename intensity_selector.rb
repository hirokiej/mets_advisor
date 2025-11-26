# frozen_string_literal: true

require_relative 'i18n'

module MetsAdvisor
  class IntensitySelector
    INTENSITY_TRANSLATIONS = {
      'ja' => {
        prompt_intensity: '運動の強度を選んでください',
        light: '軽度（徒歩・ピラティスなど）',
        moderate: '中程度（やや早歩きなど）',
        vigorous: '強度（ジョギング・ランニング・サイクリングなど）',
        prompt_level: '以下から該当する活動を選んでください',
        error_choice: '1から選択肢の数字を入力してください'
      },
      'en' => {
        prompt_intensity: 'Choose the intensity of exercise you usually do',
        light: 'Light (e.g. walking, pilates)',
        moderate: 'Moderate (e.g. brisk walking)',
        vigorous: 'Vigorous (e.g. jogging, running, cycling)',
        prompt_level: 'Choose the activity that applies to you',
        error_choice: 'Please enter a number from 1 to the number of choices'
      },
      'fr' => {
        prompt_intensity: 'Choisissez l\'intensité de votre activité physique',
        light: 'Légère (ex : marche lente, pilates)',
        moderate: 'Modérée (ex : marche rapide)',
        vigorous: 'Élevée (ex : jogging, course, vélo)',
        prompt_level: 'Sélectionnez l\'activité qui vous correspond',
        error_choice: 'Veuillez entrer un numéro de 1 au nombre de choix'
      },
      'es' => {
        prompt_intensity: 'Elige la intensidad del ejercicio que sueles hacer',
        light: 'Ligera (ej. caminar, pilates)',
        moderate: 'Moderada (ej. caminata rápida)',
        vigorous: 'Vigorosa (ej. trotar, correr, ciclismo)',
        prompt_level: 'Elige la actividad que se aplica a ti',
        error_choice: 'Por favor ingresa un número del 1 al número de opciones'
      }
    }.freeze

    # METs値の定義
    LIGHT_ACTIVITIES = {
      'ja' => {
        'ゆったり歩く・ピラティス' => 3.0,
        '少し速めに歩く' => 4.0
      },
      'en' => {
        'Easy walking / Pilates' => 3.0,
        'Brisk walking (slightly faster)' => 4.0
      },
      'fr' => {
        'Marche tranquille / Pilates' => 3.0,
        'Marche un peu rapide' => 4.0
      },
      'es' => {
        'Caminar tranquilo / Pilates' => 3.0,
        'Caminar algo rápido' => 4.0
      }
    }.freeze
    
    MODERATE_ACTIVITIES = {
      'ja' => {
        'かなり速い歩行' => 5.0,
        'ゆっくりジョギング' => 6.0,
        'ジョギング' => 7.0
      },
      'en' => {
        'Fast walking' => 5.0,
        'Slow jogging' => 6.0,
        'Jogging' => 7.0
      },
      'fr' => {
        'Marche rapide' => 5.0,
        'Jogging lent' => 6.0,
        'Jogging' => 7.0
      },
      'es' => {
        'Caminar rápido' => 5.0,
        'Trote lento' => 6.0,
        'Trotar' => 7.0
      }
    }.freeze
    
    VIGOROUS_ACTIVITIES = {
      'ja' => {
        'サイクリング' => 8.0,
        'ランニング（1km8分ペース）' => 9.0,
        'ランニング（1km6分ペース）' => 10.0,
        '非常に激しい運動' => 15.0
      },
      'en' => {
        'Cycling' => 8.0,
        'Running (8 min/km pace ≒ 9:39 min/mile)' => 9.0,
        'Running (6 min/km pace ≒ 12:52 min/mile)' => 10.0,
        'Very vigorous exercise' => 15.0
      },
      'fr' => {
        'Cyclisme' => 8.0,
        'Course (8 min/km)' => 9.0,
        'Course (6 min/km)' => 10.0,
        'Exercice très intense' => 15.0
      },
      'es' => {
        'Ciclismo' => 8.0,
        'Correr (8 min/km)' => 9.0,
        'Correr (6 min/km)' => 10.0,
        'Ejercicio muy intenso' => 15.0
      }
    }.freeze
    
    def initialize(i18n, selector)
      @i18n = i18n
      @selector = selector
      @locale = i18n.locale
    end

    def select_activity_intensity
      choices = [t(:light), t(:moderate), t(:vigorous)]
      @selector.select(t(:prompt_intensity), choices) + 1
    end

    def select_activity_levels(intensity)
      activities = case intensity
                   when 1
                     LIGHT_ACTIVITIES[@locale]
                   when 2
                     MODERATE_ACTIVITIES[@locale]
                   when 3
                     VIGOROUS_ACTIVITIES[@locale]
                   end

      choices = activities.keys
      index = @selector.select(t(:prompt_level), choices)
      activities.values[index]
    end

    private

    def t(key)
      INTENSITY_TRANSLATIONS[@locale][key] || INTENSITY_TRANSLATIONS['en'][key] || key.to_s
    end
  end
end
