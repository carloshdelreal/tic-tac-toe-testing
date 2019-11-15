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
    @players = []
    @display = Display.new

    @turn_toplay = 0 # it changes from 0 to 1 depending on the turn
  end

  def play
    @display.print_board(@players)

    loop do
      valid = next_move
      next unless valid

      if @board.winner?(@players[@turn_toplay].played) == true
        banner_msg("The winner is #{@players[@turn_toplay].name}")
        break
      elsif @board.draw == true
        banner_msg("It's a Draw")
        break
      end
      switch_turn
    end
  end

  def players_initialize
    player1 = Player.new(@display.player_name(1))
    player2 = Player.new(@display.player_name(2))
    player1.symbol = @display.player_symbol(player1.name)
    player2.symbol = player1.oposite_symbol
    @players = [player1, player2]
  end

  def reset
    players_initialize if @players.empty?
    @board.reset
    @players[0].reset
    @players[1].reset
  end

  def next_move
    move = @display.ask_play(@players[@turn_toplay].name, @board.played)

    unless move.nil?
      @players[@turn_toplay].choose(move)
      return true
    end

    false
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

end
