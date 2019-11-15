# frozen_string_literal: true

RSpec.describe Player do
  describe 'Create a player' do
    before(:example) do
      @player = Player.new
    end
    it 'Define Player Name' do
      @player.name = 'Carlos'
      expect(@player.name).to eql('Carlos')
    end
    it 'Adds a play' do
      @player.choose(1)
      expect(@player.played).to include(1)
    end
    it 'Sets a symbol' do
      @player.symbol = 'X'
      expect(@player.symbol).to eql('X')
    end
  end
end
