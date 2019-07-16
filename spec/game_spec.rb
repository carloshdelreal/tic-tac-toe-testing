require './lib/game'
require 'stringio'

# before(:each) do
#     @game = Board.new
#     @board1 = double('board')
# end

RSpec.describe Game do
  describe '#switch_turn' do
    it 'if given 0 return 1' do
      game = Game.new
      game.turn_toplay = 0
      game.switch_turn
      expect(game.switch_turn).to eql(0)
    end
    it 'if given 1 return 0' do
      game = Game.new
      game.turn_toplay = 1
      expect(game.switch_turn).to eql(0)
    end
  end
  describe '#ask_sameplayers' do
    before do
      $stdin = StringIO.new('Y')
    end
    it 'Will return true if Y' do
      game = Game.new
      game.ask_sameplayers
      allow($stdin).to receive(:gets).and_return('Y')
      expect(game.ask_sameplayers).to eql(true)
    end
    it 'Will return true if y' do
      game = Game.new
      game.ask_sameplayers
      allow($stdin).to receive(:gets).and_return('y')
      expect(game.ask_sameplayers).to eql(true)
    end
    it 'Will return false if N' do
        game = Game.new
        game.ask_sameplayers
        allow($stdin).to receive(:gets).and_return('N')
        expect(game.ask_sameplayers).to eql(false)
      end
  end
end
