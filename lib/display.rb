# frozen_string_literal: true

require '../lib/player'
# Display class, It interacts with the console
class Display
  def console_data
    intro = gets.chomp
    intro
  end

  def player_name(number)
    valid = false
    loop do
      puts "what is the name of player #{number} ?"
      data = console_data
      valid = Player.valid_player?(data)
      puts 'invalid input' unless valid
      next unless valid

      return data
    end
  end

  def player_symbol(name)
    valid = false
    loop do
      puts "What symbol for #{name}? X or O"
      data = console_data
      valid = Player.valid_symbol?(data)
      puts 'invalid input' unless valid
      next unless valid

      return data.downcase
    end
  end

  def ask_playagain
    valid = false
    loop do
      puts 'Do you want to play again? Y/N'
      data = console_data
      valid = valid_choice?(data)
      invalid_response unless valid
      next unless valid

      return data
    end
  end

  def ask_play(name, played)
    valid = false
    loop do
      puts "Turn for #{name}"
      data = console_data
      valid = valid_board_choice?(data, played)
      invalid_response unless valid
      next unless valid

      return data
    end
  end

  def ask_sameplayers
    valid = false
    loop do
      puts 'Play with the same players Y/N'
      data = console_data
      valid = valid_yn_choice?(data)
      invalid_response unless valid
      next unless valid

      return data
    end
  end

  def valid_yn_choice?(string)
    return true if string.downcase == 'y' || string.downcase == 'n'

    false
  end

  def valid_board_choice?(data, played)
    data = data.to_i
    return true if data.positive? && data < 10 && played.none?(data)

    false
  end

  def welcome
    puts %(-----------------------------------------------------------------------------------)
    puts %(Welcome to this tic-tac-toe game, built by Carlos del Real)
    puts %(-----------------------------------------------------------------------------------)
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

  def print_board(players)
    string = ''
    (1..3).each { |n| string += "| #{number_or_symbol(players, n)} |" }
    puts string
    string = ''
    (4..6).each { |n| string += "| #{number_or_symbol(players, n)} |" }
    puts string
    string = ''
    (7..9).each { |n| string += "| #{number_or_symbol(players, n)} |" }
    puts string
  end

  def number_or_symbol(players, number)
    return players[0].symbol if players[0].played.include? number
    return players[1].symbol if players[1].played.include? number

    number
  end
end
