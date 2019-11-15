# frozen_string_literal: true

RSpec.describe Display do
  describe 'Display Ask' do
    it 'ask' do
      game = Display.new
      game.console_data
      expect(game.console_data).to eql('')
    end
  end
end
