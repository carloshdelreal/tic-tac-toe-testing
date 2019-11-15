# frozen_string_literal: true

class Player
  attr_accessor :played, :name, :symbol

  def initialize()
    @played = []
  end

  def choose(number)
    return if number.nil?

    @played << number
  end

  def symbol_choose(string)
    @symbol = string
  end
end
