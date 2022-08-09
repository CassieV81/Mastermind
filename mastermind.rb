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

  def guess_number
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
    @player.each do |i|
      if @num.include?(i) && @num.index(i) == @player.index(i)
        @check.push('o')
      elsif @num.include?(i) && @num.index(i) != @player.index(i)
        @check.push('x')
      end
    end
    p @check
  end
end

mastermind = Mastermind.new
mastermind.guess_number
