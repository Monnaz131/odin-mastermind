require 'colorize'
# One parent class: Mastermind. Two child classes: Codebreaker and codemaker.
class Mastermind
  def initialize
    @pegs = { 1 => :blue, 2 => :red, 3 => :yellow, 4 => :magenta, 5 => :cyan, 6 => :green }
  end
  
  #puts String.colors
  #puts String.modes
  #puts String.color_samples
  puts 'Hello world'.on_blue
  puts 'Hello world'.on_red
  puts 'Hello world'.on_yellow
  puts 'Hello world'.on_green
  puts 'Hello world'.on_magenta
  puts 'Hello world'.on_cyan
end

Mastermind.new
