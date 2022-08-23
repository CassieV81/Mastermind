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

class ComputerGuess 
  
  def initialize
    @code = random_num
    @player = ''
    @selector = ''
    @hint = []
    @guess = []
  end

  def computer_guess
    @guess = [1111, 2222, 3333, 4444, 5555, 6666]
    # guess2 = [1, 2, 3, 4, 5, 6]
    # # @guess[0].digits.reverse
    # @player = @guess[0].digits.reverse if @hint == []
    # while @hint == []
      @guess.each do |x|
        @player = x.digits.reverse
        check_num
        case @hint
        when ['o']
          @player = 1222.digits.reverse
        when %w[o o]
          @player = 1122.digits.reverse
        when %w[o o o]
          @player = 1112.digits.reverse
        when %w[o o o o]
          puts 'You Win!'
        end
      end
    # end
    # check_num
  end
end

class Mastermind < ComputerGuess
  include Master
  # def initialize
  #   super
  # end

  def instructions
    puts 'Select 1 if you want to be the code maker'
    puts 'Select 2 if you want to be the code breaker'
  end

  def check_num
    @player.each_with_index do |value, index|
      if @code.include?(value)
        # changing syntax from index() to at() solved the
        # issue of pushing 'o' only once when there is multiple numbers
        if @code.at(index) == value
          @hint.push('o')
        elsif @code.index(value) != index && @player.all? { |i| i == value } == false
          @hint.push('x')
        end
      end
    end
    p @hint.join
  end

  def computer_guess
    super
  end

  def computer_play
    3.times do
      p computer_guess
      @hint = []
      # check_num
    end
  end

  def code_maker
    puts 'Input 4 numbers between 1 and 6 to create code'
    @player = gets.chomp.to_i
    @code = @player.digits.reverse
    computer_play
  end

  def code_breaker
    puts 'Guess correct code by inputing 4 numbers between 1 and 6...'
    12.times do
      @player = gets.chomp.to_i.digits.reverse
      if @player == @code
        puts 'You win, Congratulations!'
        return
      else
        check_num
        puts 'Try again..'
        @hint = []
      end
    end
    puts "You lost, the correct code is #{@code}"
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
