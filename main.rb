require 'colorize'
# One parent class: Mastermind. Two child classes: Codebreaker and codemaker.
class Mastermind
  def initialize
    @pegs = { 1 => :blue, 2 => :red, 3 => :yellow, 4 => :magenta, 5 => :cyan, 6 => :green }
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
end

Mastermind.new
