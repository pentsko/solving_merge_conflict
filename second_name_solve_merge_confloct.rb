# require 'timers'

class Dictionary
  attr_accessor :name
  puts "Enter your name: "

  def initialize(name)
    name = gets.chomp!
    @name = name
  end

  def say_hello
    puts "Hello #{@name}, let's start..."

    # timers = Timers::Group.new
    # Timers::Group #after:
    # one_second_timer = timers.after(1) {
      puts "#{@name} for chose First enter '1'"
      puts "#{@name} для того щоб вибрати Second введіть '2'"
    # }
    # timers.wait

    def chose_item
      user_chose_item = gets.chomp

      if user_chose_item == "1"
        File.open("First.txt", "r") do |file|
          read_file = file.readlines
          puts read_file
          puts "***"
          puts "#{@name} нажміть  '1' коли будете готові перейти до тестів"
        end

      elsif user_chose_item == "2"
        File.open("Second.txt", "r") do |file|
          read_file = file.readlines
          puts read_file
          puts "***"
          puts "#{@name} нажміть будь яку цифру коли будете готові перейти до тестів"
        end
      end
    end

    def testing_entering_translation
      enter_chose_item = gets.chomp
      if enter_chose_item == "1"
        hash = []
        File.open("First.txt", "r+") do |file|
          hash = file.readlines
        end
        hash.find_all do |el|
          first, *last = el.split(/ - /)
          puts last
          puts "#{@name} enter translation: "
          user_word = gets.upcase.chomp

          if user_word.upcase == first.upcase
            puts "Wonderfull of first try "

          else
            while user_word.upcase != first.upcase do
              File.open("learn.txt", "w") do |file|
                file.write("#{first}, #{last}")
                puts first[0]
              end

              user_word = gets.chomp
              if user_word.upcase == first.upcase
                puts "Правильно з другої спроби"
              elsif user_word.upcase != first.upcase
                length_of_half_word = (first.length - 1) / 2
                puts first[0..length_of_half_word].to_s
                user_word = gets.chomp
                if user_word.upcase == first.upcase
                  puts "Правильно з третьої спроби"
                else
                  puts (first)
                end
              end
            end
          end
        end
      else
        hash = []
        File.open("Second.txt", "r+") do |file|
          hash = file.readlines
        end
        hash.find_all do |el|

          first, *last = el.split(/ - /)

          puts last
          puts "#{@name} введіть переклад: "
          user_word = gets.chomp
          if user_word.upcase == first.upcase
            puts "Very good, you done this in first chance"
          else
            while user_word.upcase != first.upcase do
              File.open("learn.txt", "w") do |file|
                file.write("#{first}, #{last}")
              end
              puts first[0]
              user_word = gets.chomp
              if user_word.upcase == first.upcase
                puts "Правильно з другої спроби"
              elsif user_word.upcase != first.upcase
                length_of_half_word = (first.length - 1) / 2
                puts first[0..length_of_half_word].to_s
                user_word = gets.chomp
                if user_word.upcase == first.upcase
                  puts "Правильно з третьої спроби"
                else
                  puts (first)
                end
              end
            end
          end
        end

      end
    end

  end
end

dictionary = Dictionary.new("Taras")
dictionary.say_hello
dictionary.chose_item
dictionary.testing_entering_translation
