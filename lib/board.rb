# frozen_string_literal: true

class Board
  attr_accessor :played
  attr_reader :board_numbers
  attr_reader :winning

  def initialize
    @board_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9],
                [3, 5, 7], [3, 6, 9], [1, 4, 7], [2, 5, 8]]
    @played = []
  end

  def choose(number)
    if valid_number?(number)
      @played << number
      return number
    end
    nil
  end

  def valid_number?(number)
    return false unless number.class == Integer

    return true if number.positive? && number < 10 && @played.none?(number)

    false
  end

  def checking(arr)
    @winning.each do |x|
      return true if contains_all?(arr, x)
    end
    false
  end
  def reset
    @played = []
  end
end
