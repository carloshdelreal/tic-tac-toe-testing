# frozen_string_literal: true

require '../lib/board'
require '../lib/game'
require '../lib/display'

game = Game.new
display = Display.new

sameplayers = false
playagain = true

loop do
  break if playagain == false

  if sameplayers == true
    game.reset
    game.play
  elsif sameplayers == false
    game.reset
    display.welcome
    game.play
  end
  playagain = game.ask_playagain
  next unless playagain == true

  sameplayers = game.ask_sameplayers
end
