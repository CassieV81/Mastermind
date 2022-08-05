# frozen_string_literal: true

module Master
  def random_num
    num = (1..6).to_a
    rand_num = num.sample(4)
  end
end


class Mastermind
  include Master
  def initialize
    @num
  end

  def random_number
    @num = random_num
  end

  def guess_number
    puts @num
    2.times do
      player = gets.chomp.to_i
      if player == @num
      puts 'You win'
      break
      else
        puts 'Try again..'
      end
    end
  end

end

mastermind = Mastermind.new
mastermind.random_number
mastermind.guess_number