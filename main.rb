# frozen_string_literal: true

require 'colorize'

# Module containing input values
module Gameplay
  RANGE = ['1', '2', '3', '4', '5', '6']

  def player_input
    puts 'Enter four numbers between 1 and 6 and press enter.'
    input = gets.chomp
    input_ascii = input.each_byte.to_a
    until input.length == 4 && input_ascii.all? { |e| e >= 49 && e <= 54 }
      puts 'Only 4 numbers!!!'
      input = gets.chomp
      input_ascii = input.each_byte.to_a
    end
    @player_input_code = input.split('')
  end
end

# Class for replay function
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play_again
    puts "Enter 'y' to play again, or 'n' to quit: "
    answer = gets.chomp
    case answer
    when 'y' || 'Y'
      @board = Board.new
      @board.decide_play_method
      play_again
    else
      puts 'Thanks for playing!'
    end
  end
end

# Class to set up code breaker and code maker child classes
# Also sets up game logic
class Board
  include Gameplay
  attr_accessor :maker_board, :turn_count, :breaker

  def initialize
    @maker_board = []
    @breaker_board = []
    @winner = false
    @match = 0
    @partial = 0
    @player_breaker = PlayerBreaker.new
    @player_maker = PlayerMaker.new
    puts "Enter '1' to be the code breaker or '2' to be the code maker: "
    @player_choice = gets.chomp
    @turn_count = 1
  end

  # If player is breaker, set instance variables
  def player_is_breaker
    @breaker_board = @player_breaker.player_input_code
  end

  # If player is maker, set instance variables
  def player_is_maker
    @maker_board = @player_maker.player_input_code
    @breaker_board = @player_maker.ai_input_code
  end

  # Computer generated code
  def computer_maker
    i = 1
    while i <= 4 do
      value = Gameplay::RANGE.sample
      @maker_board << value
      i += 1
    end
  end

  # Check for correct code guess
  def check_winner
    if @maker_board == @breaker_board
      @turn_count = 13
      @winner = true
    end
  end

  # Check for matches or partials
  def check_match_partial
    @match = 0
    @partial = 0
    @maker_board.each_with_index do |a, i|
      @breaker_board.each_with_index do |b, j|
        if a == b && i == j
          @match += 1
        elsif a == b && i != j
          @partial += 1
        end
      end
    end
    puts "Match: #{@match}"
    puts "Partial: #{@partial}"
    puts "\r\n"
  end

  # Determine winner
  def result
    case @player_choice
    when '1'
      if @winner == true
        puts 'Congratulations, you cracked the code!'
      else
        puts "You couldn't crack the code! The code was #{@maker_board.join}. Better luck next time!"
      end
    else
      if @winner == true
        puts 'The machine cracked your code!'
      else
        puts "The machine couldn't crack your code. You win!!!"
      end
    end
  end

  # Determine which play method to execute
  def decide_play_method
    if @player_choice == '1'
      play_player_breaker
    else
      play_player_maker
    end
  end

  # Execute if player is code breaker
  def play_player_breaker
    computer_maker
    until @turn_count >= 13
      puts "Turn #{@turn_count}"
      @player_breaker.player_input
      player_is_breaker
      check_winner
      check_match_partial
      @turn_count += 1
    end
  end

  # Execute if player is code maker
  def play_player_maker
    @player_maker.player_input
    @player_maker.first_guess
    check_match_partial
    @turn_count += 1
    until @turn_count >= 13
      puts "Turn #{@turn_count}"
      @player_maker.solve
      player_is_maker
      check_winner
      check_match_partial
      @turn_count += 1
      sleep(0.25)
    end
    result
  end
end

# Player is code breaker
class PlayerBreaker
  include Gameplay
  attr_accessor :player_input_code

  def initialize
    @player_input_code = []
  end
end

# Player is the code maker
class PlayerMaker
  include Gameplay
  attr_accessor :player_input_code, :ai_input_code

  def initialize
    @player_input_code = []
    @ai_input_code = []
  end

  # First guess - All four values are the same
  def first_guess
    value = Gameplay::RANGE.sample
    i = 1
    while i <= 4
      @ai_input_code << value
      i += 1
    end
    puts "Machine guessed #{@ai_input_code}"
  end

  # Keeps matches and chooses a new random number for non-matches
  def solve
    new_guess = []
    i = 0
    while i <= 3
      if @player_input_code[i] == @ai_input_code[i]
        new_guess << @player_input_code[i]
      else
        value = Gameplay::RANGE.sample
        new_guess << value
      end
      i += 1
    end
    @ai_input_code = new_guess
    puts "Machine guessed #{@ai_input_code}"
  end
end

puts "This is a one-player game of Mastermind."
puts "You can choose to either be the #{'codemaker'.underline} or the #{'codebreaker'.underline}."
puts "#{'Rules:'.bold}"
puts "A secret code of 4 colors need to cracked in 12 guesses or less. After each guess, the codemaker will say 
  if there were any colors guessed correctly and if they are in the right spot, or if the guess was correct but 
  the color is in the wrong spot. Each color is assigned a number, like shown below. To guess, you need to input 
  the numbers and press enter."
puts "#{'  1  '.on_blue} #{'  2  '.on_red} #{'  3  '.on_yellow} #{'  4  '.on_magenta} #{'  5  '.on_cyan} #{'  6  '.on_green}"

game = Game.new
game.board.decide_play_method
game.play_again
