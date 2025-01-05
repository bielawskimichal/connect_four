# frozen_string_literal: true

require_relative 'player'

LINES = [
  [1, 0],
  [0, 1],
  [1, 1],
  [-1, 1]
].freeze
class Game
  attr_accessor :board
  attr_reader :player_one, :player_two

  def initialize
    @player_one = Player.new(self, 0, 'a')
    @player_two = Player.new(self, 1, 'b')
    @board = Array.new(8) { Array.new(6) }
    @current_player_id = 0
  end

  def play
    loop do
      update_board(current_player)
      if player_wins?(current_player)
        print_board
        puts "#{current_player} wins!"
        return
      end

      print_board

      switch_players!
    end
  end

  def print_board
    row = 6
    6.times do
      puts "#{print_marker(@board[1][row])} | #{print_marker(@board[2][row])} | #{print_marker(@board[3][row])} | #{print_marker(@board[4][row])} | #{print_marker(@board[5][row])} | #{print_marker(@board[6][row])} | #{print_marker(@board[7][row])}\n"
      puts '--+---+---+---+---+---+--' unless row <= 1

      row -= 1
    end
    puts "\n"
  end

  def print_marker(position)
    position.nil? ? ' ' : position
  end

  def current_player
    @current_player_id.zero? ? @player_one : @player_two
  end

  # Changes current player id
  def switch_players!
    @current_player_id = (@current_player_id - 1) * -1
  end

  # Updates board by placing given user's marker
  def update_board(player)
    column = player.place_marker!
    row = (@board[column] - [nil]).length + 1
    @board[column][row] = player.marker
  end

  # Checks all possible winning configurations for given player
  def player_wins?(player)
    @board.each_with_index do |col, col_idx|
      next unless @board[col_idx].include?(player.marker)

      col.each_with_index do |row, row_idx|
        next if @board[col_idx][row_idx] != player.marker
        return true if check_all?(col_idx, row_idx, player)
      end
    end
    false
  end

  def check_all?(col_nb, row_nb, player)
    if check_horizontal?(row_nb,
                         player) || check_vertical?(col_nb,
                                                    player) || check_diagonal_right?(col_nb, row_nb,
                                                                                     player) || check_diagonal_left?(
                                                                                       col_nb, row_nb, player
                                                                                     )
      true
    else
      false
    end
  end

  def check_horizontal?(row_nb, player)
    consecutive = 0
    (0...@board.length).each do |col_idx|
      if @board[col_idx][row_nb] == player.marker

        consecutive += 1
        return true if consecutive >= 4
      else
        consecutive = 0
      end
    end
    false
  end

  def check_vertical?(col_nb, player)
    consecutive = 0
    (0...@board[0].length).each do |row_idx|
      if @board[col_nb][row_idx] == player.marker

        consecutive += 1
        return true if consecutive >= 4
      else
        consecutive = 0
      end
    end
    false
  end

  def check_diagonal_right?(col_nb, row_nb, player)
    consecutive = 0
    i = col_nb
    j = row_nb
    while i < @board.length && j < @board[0].length
      if @board[i][j] == player.marker
        consecutive += 1
        return true if consecutive >= 4
      else
        consecutive = 0
      end
      i += 1
      j += 1
    end
    false
  end

  def check_diagonal_left?(col_nb, row_nb, player)
    consecutive = 0
    i = col_nb
    j = row_nb
    while i >= 0 && j < @board[0].length
      if @board[i][j] == player.marker

        consecutive += 1
        return true if consecutive >= 4
      else
        consecutive = 0
      end
      i -= 1
      j += 1
    end
    false
  end
end
