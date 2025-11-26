# frozen_string_literal: true

require 'io/console'

module MetsAdvisor
  class Selector
    ARROW_UP = "\e[A"
    ARROW_DOWN = "\e[B"
    ENTER = "\r"
    
    def initialize
      @selected_index = 0
    end

    def select(prompt, choices)
      puts prompt
      display_choices(choices, initial: true)
      
      loop do
        key = read_key
        
        case key
        when ARROW_UP
          @selected_index = (@selected_index - 1) % choices.length
          display_choices(choices)
        when ARROW_DOWN
          @selected_index = (@selected_index + 1) % choices.length
          display_choices(choices)
        when ENTER
          clear_choices(choices.length)
          puts "#{prompt} #{choices[@selected_index]}"
          return @selected_index
        end
      end
    end

    def ask(prompt, &validation)
      loop do
        print "#{prompt}: "
        input = gets.chomp
        
        if validation
          result = validation.call(input)
          if result == true
            return input.to_i
          else
            puts result
          end
        else
          return input.to_i
        end
      end
    end

    private

    def display_choices(choices, initial: false)
      clear_choices(choices.length) unless initial
      
      choices.each_with_index do |choice, index|
        if index == @selected_index
          puts "→ \e[1m#{choice}\e[0m"  # 太字で表示
        else
          puts "  #{choice}"
        end
      end
    end

    def clear_choices(count)
      print "\e[#{count}A"  # カーソルを上に移動
      print "\e[J"          # カーソル以下をクリア
    end

    def read_key
      $stdin.raw do |io|
        input = io.getc
        if input == "\e"
          input << io.read_nonblock(2) rescue nil
        end
        input
      end
    end
  end
end
