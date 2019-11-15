# frozen_string_literal: true

RSpec.describe Board do
  describe 'Choose Values' do
    before(:example) do
      @board = Board.new
    end
    it 'Chooses 1' do
      @board.choose(1)
      expect(@board.played).to include(1)
    end
    it 'Choose 1 twice' do
      @board.choose(1)
      @board.choose(1)
      expect(@board.played.count(1)).to eql(1)
    end
    it 'Choose ""' do
      expect(@board.played.length).to eql(0)
      @board.choose('')
      expect(@board.played.length).to eql(0)
    end
    it 'Choose "helo"' do
      expect(@board.played.length).to eql(0)
      @board.choose('helo')
      expect(@board.played.length).to eql(0)
    end
    it 'returns the valid number' do
      expect(@board.choose(2)).to eql(2)
    end
    it 'returns nil if invalid number' do
      @board.choose(1)
      expect(@board.choose(1)).to eql(nil)
    end
  end

  describe 'Board Valid Numbers' do
    before(:example) do
      @board = Board.new
    end
    it 'Reject any string' do
      expect(@board.valid_number?('')).to eql(false)
      expect(@board.valid_number?('hello')).to eql(false)
      expect(@board.valid_number?('bad')).to eql(false)
    end

    it 'reject nil' do
      expect(@board.valid_number?(nil)).to eql(false)
    end

    it 'reject if already choosed' do
      @board.choose(1)
      expect(@board.valid_number?(1)).to eql(false)
    end
  end
  describe 'board reset' do
    before(:example) do
      @board = Board.new
    end
    it 'choose values an then reset' do
      @board.choose(1)
      @board.choose(2)
      @board.choose(3)
      @board.reset
      expect(@board.played).to eql([])
    end
  end
end
