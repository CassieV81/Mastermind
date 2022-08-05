# frozen_string_literal: true

module Master
  def random_num
    num = (1..6).to_a
    num.sample(4)
  end
end


class Mastermind

  include Master
  def initialize
    @num = random_num
    @player
  end

  def guess_number
    p @num
    2.times do
      @player = gets.chomp.to_i.digits.reverse
      if @player == @num
        puts 'You win'
        break
      else
        check_num
        puts 'Try again..'
      end
    end
  end

  def check_num
    @num.any? do |i|
      if @player.include?(i)
        puts 'o'
      end
    end
  end

end

mastermind = Mastermind.new
# mastermind.random_number
mastermind.guess_number