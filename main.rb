require 'colorize'
# One parent class: Mastermind. Two child classes: Codebreaker and Codemaker.
class Mastermind
  def initialize
    @pegs = [1, 2, 3, 4, 5, 6]
    @is_codemaker = false
    @is_codebreaker = false
  end

  def start
    puts 'This is a one-player game of Mastermind.'
    puts "\r"
    puts "You can choose to either be the #{'codemaker'.underline} or the #{'codebreaker'.underline}."
    puts "\r"
    puts 'Rules:'.bold
    puts "\r"
    puts "A secret code of 4 colors need to cracked in 12 guesses or less. After each guess, the codemaker will say 
if there were any colors guessed correctly and if they are in the right spot, or if the guess was correct but 
the color is in the wrong spot. Each color is assigned a number, like shown below. To guess, you need to input 
the numbers and press enter."
    puts "\r"
    puts "#{'  1  '.on_blue} #{'  2  '.on_red} #{'  3  '.on_yellow} #{'  4  '.on_magenta} #{'  5  '.on_cyan} #{'  6  '.on_green}"
    puts "\r"
  end

  def codebreaker_or_codemaker
    puts "Type 1 if you want to play as the #{'codemaker'.underline}, or 2 to play as the #{'codebreaker'.underline}: "
    choice = gets
    if choice == '1'
      @is_codemaker = true
    else
      @is_codebreaker = true
    end
  end
end

game_start = Mastermind.new
game_start.start
game_start.codebreaker_or_codemaker
