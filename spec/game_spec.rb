require "./lib/game"
require "./lib/board"

# before(:each) do
#     @game = Board.new
#     @board1 = double('board')
# end

RSpec.describe Game do
    describe "#switch_turn" do
        it "if given 0 return 1" do
            game = Game.new
            expect(game.switch_turn(0)).to eql(1)
        end
        it "if given 1 return 0" do
            game = Game.new
            expect(game.switch_turn(1)).to eql(0)
        end
    end
end
