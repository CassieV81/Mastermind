# frozen_string_literal: true

class Mastermind

  def initialize
    @list = (1111..6666).to_a
  end

  def random_number
    # list = (1111..6666).to_a
    puts @list.sample
  end
end

mastermind = Mastermind.new
mastermind.random_number