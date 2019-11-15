# frozen_string_literal: true

require '../lib/player'
require '../lib/board'
require '../lib/display'
# Game class that implements the game
class Game
  attr_accessor :players, :board, :turn_toplay
  attr_reader :symbols, :playermoves

  def initialize
    @board = Board.new
    @players = [Player.new, Player.new]
    @display = Display.new

    @turn_toplay = 0 # it changes from 0 to 1 depending on the turn
  end

  def play
    @display.print_board(@players)

    loop do
      valid = next_move
      next unless valid

      if @board.checking(@playermoves[@turn_toplay]) == true
        banner_msg("The winner is #{@players[@turn_toplay]}")
        break
      elsif @board.draw == true
        banner_msg("It's a Draw")
        break
      end
      switch_turn
    end
  end

  def reset
    

  end

  def next_move
    puts "Turn to: #{@players[@turn_toplay]}, insert a digit"
    played = gets.chomp
    if played.to_i != 0 && played.to_i < 10
      valid = @board.choose(played.to_i, @symbols[@turn_toplay])
    else
      puts banner_msg('Invalid entry!')
      return false
    end

    if valid
      @playermoves[@turn_toplay].push(played.to_i)
      return true
    else
      return false
    end
  end

  def switch_turn
    @turn_toplay = if @turn_toplay.zero?
                     1
                   else
                     0
                   end
  end

  def turn(_player)
    turn_valid = false
    until turn_valid
      begin
        puts "#{@players[@turn_toplay]} it's your turn, insert a digit"
        number = gets.chomp
        turn_valid = true if number.integer?
      rescue StandardError
        turn_valid = false
        puts 'Insert a valid Integer'
      end
    end
    @board.choice(number)
  end

  def ask_playagain
    display.ask_playagain
    playagain_ans = display.console_data
    return true if playagain_ans.upcase == 'Y'

    return false if playagain_ans.upcase == 'N'

    display.invalid_response
    nil
  end

  def ask_sameplayers
    display.ask_playagain
    sameplayers_ans = display.console_data
    return true if sameplayers_ans.upcase == 'Y'

    return false if sameplayers_ans.upcase == 'N'

    display.invalid_response
    nil
  end
end
