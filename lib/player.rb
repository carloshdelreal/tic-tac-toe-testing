# frozen_string_literal: true

class Player
  attr_accessor :played, :name, :symbol

  def initialize(name)
    @name = name
    @played = []
  end

  def choose(number)
    return if number.nil?

    @played << number
  end

  def symbol_choose(string)
    @symbol = string
  end

  def reset
    @played = []
  end

  def oposite_symbol
    return 'o' if symbol == 'y'

    'y'
  end

  def self.valid_player?(name)
    return true unless name == ''

    false
  end

  def self.valid_symbol?(symbol)
    return true if symbol.downcase == 'x' || symbol.downcase == 'o'

    false
  end
end
