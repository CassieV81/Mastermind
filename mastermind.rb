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
    @numbers = [1, 2, 3, 4, 5, 6]
  end

  def computer_guess
    12.times do
      @hint = []
      @player = random_num
      p @player
      check_num
      if @player == @code
        puts 'Computer successfully cracked the code, Congratulations!'
        return
      else
        puts "Computer is trying again..."
        @hint = []
      end
    end
    puts "Computer could not crack the code, it is #{@code}"
  end

  def computer_play
    computer_guess
    @code = @guess
    check_num
  end

end

class Mastermind < ComputerGuess
  include Master

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


  def code_maker
    puts 'Input 4 numbers between 1 and 6 to create code'
    @player = gets.chomp.to_i
    @code = @player.digits.reverse
    puts 'Computer is trying to guess the code...'
    computer_guess
  end

  def code_breaker
    puts 'Guess correct code by inputing 4 numbers between 1 and 6...'
    12.times do
      @player = gets.chomp.to_i.digits.reverse
      if @player == @code
        puts 'You successfully cracked the code, Congratulations!'
        return
      else
        check_num
        puts 'Try again..'
        @hint = []
      end
    end
    puts "You could not crack the code, it is #{@code}"
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
