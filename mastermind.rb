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
    @check = []
  end

  def instructions
    puts 'Select 1 if you want to be the code maker'
    puts 'Select 2 if you want to be the code breaker'
  end

  def check_num
    @player.each_with_index do |value, index|
      if @num.include?(value)
        if @num.index(value) == index
          @check.push('o')
        elsif @num.index(value) != index && @player.all? { |i| i == value } == false
          @check.push('x')
        end
      end
    end
    p @check.join
  end

  def code_maker
    @player = gets.chomp.to_i
  end

  def code_breaker
    p @num
    5.times do
      @player = gets.chomp.to_i.digits.reverse
      if @player == @num
        puts 'You win'
        break
      else
        check_num
        puts 'Try again..'
        @check = []
      end
    end
  end

  def check_num
    @player.each_with_index do |value, index|
      if @num.include?(value) && @num.index(value) == index
        @check.push('o')
      elsif @num.include?(value) && @num.index(value) != index
        @check.push('x')
      end
    end
    p @check.join
  end
end

mastermind = Mastermind.new
mastermind.guess_number
