RSpec.describe Board do
  describe '#reset_board' do
    it 'Will check if board is reseted' do
      board = Game.new
      board.reset_board
      expect(board.board.board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end

    it 'Will check if player moves are reseted' do
      board = Game.new
      board.reset_board
      expect(board.playermoves).to eql([[], []])
    end
  end
  describe 'checking' do
    it 'Will check if a player won the board' do
      board = Board.new

      expect(board.checking([1, 5, 9])).to eql(true)
    end
    it 'Will check if a player won the board another combination' do
      board = Board.new

      expect(board.checking([3, 6, 9])).to eql(true)
    end
  end
  describe '#no_int' do
    it 'There are not ints in the array' do
      game = Game.new
      game.board.board = [%w[X X O], %w[X X O], %w[X X O]]
      expect(game.board.draw).to eql(true)
    end
    it 'There are not ints in the array' do
      game = Game.new
      game.board.board = [%w[X X O], %w[X X O], ['X', 'X', 9]]
      expect(game.board.draw).to eql(false)
    end
  end
end
