# frozen_string_literal: true

module MetsAdvisor
  class I18n
    TRANSLATIONS = {
      'ja' => {
        prompt_steps: '1週間の歩数を1日平均で教えてください',
        prompt_active_days: '1週間に何日間運動をしていますか?',
        prompt_activity_minutes: 'その運動は1日合計で何分ほどですか?',
        error_number: '数字のみを入力してください',
        error_empty: '数字を入力してください',
        error_range: '0−7の数字を入力してください',
        ideal_title: '🎉あなたの身体活動量は理想値を上回っています！🎉',
        ideal_mets: 'あなたの身体活動量は【%{total_mets}Mets】です。',
        ideal_message: '素晴らしいですね！これからもこの身体活動量を続け、健康を維持してください！',
        sufficient_title: '🙆‍♀️あなたの身体活動量は健康維持に適しています🙆‍♀️',
        sufficient_shortage: '理想値まで残り【%{mets_shortage}Mets】です。',
        sufficient_suggestion: '💡以下を取り入れると理想的な１週間の身体活動量となります💡',
        insufficient_title: '🚨あなたは運動不足です！🚨',
        insufficient_shortage: 'あなたの身体活動量は【%{mets_shortage}Mets】不足しています。',
        insufficient_message: '身体活動量を増やすことで生活習慣病のリスクを減らせます。',
        insufficient_suggestion: '💡以下が１週間で必要な身体活動量の目安です💡',
        walking: '🚶ウォーキング(4メッツ): %{minutes}分以上(1日あたり%{daily}分)',
        running: '🏃軽いランニング(9メッツ): %{minutes}分以上(1日あたり%{daily}分)',
        separator: '---------------------------------------------------'
      },
      'en' => {
        prompt_steps: 'What is your daily average steps per week?',
        prompt_active_days: 'How many days per week do you exercise?',
        prompt_activity_minutes: 'How many minutes per day do you exercise in total?',
        error_number: 'Enter numbers only',
        error_empty: 'Enter a number',
        error_range: 'Enter a number between 0-7',
        ideal_title: '🎉Your physical activity level exceeds the ideal value!🎉',
        ideal_mets: 'Your physical activity level is 【%{total_mets}Mets】.',
        ideal_message: 'Excellent! Keep up this level of physical activity to maintain your health!',
        sufficient_title: '🙆‍♀️Your physical activity level is suitable for health maintenance🙆‍♀️',
        sufficient_shortage: '【%{mets_shortage}Mets】 remaining to reach the ideal value.',
        sufficient_suggestion: '💡The following will help you achieve the ideal weekly physical activity💡',
        insufficient_title: '🚨You are not getting enough exercise!🚨',
        insufficient_shortage: 'Your physical activity is lacking by 【%{mets_shortage}Mets】.',
        insufficient_message: 'Increasing physical activity can reduce the risk of lifestyle diseases.',
        insufficient_suggestion: '💡Here is a guideline for the required weekly physical activity💡',
        walking: '🚶Walking(4 METs): %{minutes}+ min (avg %{daily} min/day)',
        running: '🏃Light Running(9 METs): %{minutes}+ min (avg %{daily} min/day)',
        separator: '---------------------------------------------------'
      },
      'fr' => {
        prompt_steps: 'Quelle est votre moyenne quotidienne de pas par semaine?',
        prompt_active_days: 'Combien de jours par semaine faites-vous de l\'exercice?',
        prompt_activity_minutes: 'Combien de minutes par jour faites-vous de l\'exercice au total?',
        error_number: 'Entrer uniquement des chiffres',
        error_empty: 'Entrer un nombre',
        error_range: 'Entrer un nombre entre 0 et 7',
        ideal_title: '🎉Votre niveau d\'activité physique dépasse la valeur idéale!🎉',
        ideal_mets: 'Votre niveau d\'activité physique est de 【%{total_mets}Mets】.',
        ideal_message: 'Excellent! Continuez ce niveau d\'activité physique pour maintenir votre santé!',
        sufficient_title: '🙆‍♀️Votre niveau d\'activité physique convient au maintien de la santé🙆‍♀️',
        sufficient_shortage: '【%{mets_shortage}Mets】 restant pour atteindre la valeur idéale.',
        sufficient_suggestion: '💡Les activités suivantes vous aideront à atteindre l\'activité physique hebdomadaire idéale💡',
        insufficient_title: '🚨Vous ne faites pas assez d\'exercice!🚨',
        insufficient_shortage: 'Votre activité physique manque de 【%{mets_shortage}Mets】.',
        insufficient_message: 'Augmenter l\'activité physique peut réduire le risque de maladies liées au mode de vie.',
        insufficient_suggestion: '💡Voici un guide pour l\'activité physique hebdomadaire requise💡',
        walking: '🚶Marche(4 METs): %{minutes}+ min (moy. %{daily} min/jour)',
        running: '🏃Course légère(9 METs): %{minutes}+ min (moy. %{daily} min/jour)',
        separator: '---------------------------------------------------'
      },
      'es' => {
        prompt_steps: '¿Cuál es tu promedio diario de pasos por semana?',
        prompt_active_days: '¿Cuántos días a la semana haces ejercicio?',
        prompt_activity_minutes: '¿Cuántos minutos por día haces ejercicio en total?',
        error_number: 'Ingresa solo números',
        error_empty: 'Ingresa un número',
        error_range: 'Ingresa un número entre 0-7',
        ideal_title: '🎉¡Tu nivel de actividad física supera el valor ideal!🎉',
        ideal_mets: 'Tu nivel de actividad física es 【%{total_mets}Mets】.',
        ideal_message: '¡Excelente! ¡Mantén este nivel de actividad física para mantener tu salud!',
        sufficient_title: '🙆‍♀️Tu nivel de actividad física es adecuado para el mantenimiento de la salud🙆‍♀️',
        sufficient_shortage: '【%{mets_shortage}Mets】 restantes para alcanzar el valor ideal.',
        sufficient_suggestion: '💡Lo siguiente te ayudará a lograr la actividad física semanal ideal💡',
        insufficient_title: '🚨¡No estás haciendo suficiente ejercicio!🚨',
        insufficient_shortage: 'Tu actividad física carece de 【%{mets_shortage}Mets】.',
        insufficient_message: 'Aumentar la actividad física puede reducir el riesgo de enfermedades del estilo de vida.',
        insufficient_suggestion: '💡Aquí hay una guía para la actividad física semanal requerida💡',
        walking: '🚶Caminar(4 METs): %{minutes}+ min (prom. %{daily} min/día)',
        running: '🏃Correr ligero(9 METs): %{minutes}+ min (prom. %{daily} min/día)',
        separator: '---------------------------------------------------'
      }
    }.freeze

    attr_reader :locale

    def initialize(locale = 'ja')
      @locale = locale
    end

    def t(key, **options)
      text = TRANSLATIONS[@locale][key] || TRANSLATIONS['en'][key] || key.to_s
      options.each do |k, v|
        text = text.gsub("%{#{k}}", v.to_s)
      end
      text
    end

    def self.available_locales
      {
        'ja' => '日本語',
        'en' => 'English',
        'fr' => 'Français',
        'es' => 'Español'
      }
    end
  end
end
