# frozen_string_literal: true

module Master
  def random_num
    num = (1..6).to_a
    rand_num = []
    4.times do
      rand_num.push(num.sample)
    end
    rand_num
  end
end

class Mastermind
  include Master
  def initialize
    @num = random_num
    @player = ''
    @selector = ''
    @check = []
  end

  def instructions
    puts 'Select 1 if you want to be the code maker'
    puts 'Select 2 if you want to be the code breaker'
  end

  def check_num
    @player.each_with_index do |value, index|
      if @num.include?(value)
        if @num.at(index) == value
          @check.push('o')
        elsif @num.index(value) != index && @player.all? { |i| i == value } == false
          @check.push('x')
        end
      end
    end
    p @check.join
  end

  def code_maker
    puts 'Input 4 numbers between 1 and 6 to create code'
    @player = gets.chomp.to_i
  end

  def code_breaker
    p @num
    puts 'Guess correct code by inputing 4 numbers between 1 and 6...'
    5.times do
      @player = gets.chomp.to_i.digits.reverse
      if @player == @num
        puts 'You win, Congratulations!'
        return
      else
        check_num
        puts 'Try again..'
        @check = []
      end
    end
    puts "You lost, the correct code is #{@num}"
  end

  def select_player
    @selector = gets.chomp.to_i
    case @selector
    when 1
      code_maker
    when 2
      code_breaker
    else
      puts 'Wrong input, please select 1 or 2'
      select_player
    end
  end
end

mastermind = Mastermind.new
mastermind.instructions
mastermind.select_player
