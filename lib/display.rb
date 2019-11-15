# frozen_string_literal: true

# Display class, It interacts with the console
class Display
  def console_data
    intro = gets.chomp
    intro
  end

  def welcome
    puts %(---------------------------------------------------------------
      --------------------)
    puts %(Welcome to this tic-tac-toe game, built by Carlos del Real)
    puts %(----------------------------------------------------------------
      -------------------)
  end

  def ask_name_player_1
    puts 'what is the name of player 1 ?'
  end

  def ask_name_player_2
    puts 'what is the name of player 2 ?'
  end

  def say_sorting
    puts 'Sorting the first turn ...'
  end

  def say_players_symbols(players)
    puts "Hello #{@players[0]} you go X and #{@players[1]} plays with O"
  end

  def banner_msg(message)
    puts ''
    puts ''
    puts message
    puts ''
    puts ''
  end

  def invalid_response
    banner_msg('Invalid Response')
  end

  def ask_playagain
    puts 'Do you want to play again? Y/N'
  end

  def print_board(players)
    string = ''
    (1...3).each { |n| string += " #{number_or_symbol(players, n)} " }
    puts string
    string = ''
    (4...6).each { |n| string += " #{number_or_symbol(players, n)} " }
    puts ''
    string = ''
    (7...9).each { |n| string += " #{number_or_symbol(players, n)} " }
    puts ''
  end

  def number_or_symbol(players, number)
    return players[0].symbol if players[0].played.include? number
    return players[1].symbol if players[1].played.include? number

    number
  end
end
