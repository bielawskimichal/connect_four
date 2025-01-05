# frozen_string_literal: true

require_relative 'game'

class Player
  def initialize(game, id, marker)
    @game = game
    @id = id
    @marker = marker
  end

  def to_s
    "Player: \"#{@marker}\""
  end

  attr_reader :marker

  def place_marker!
    loop do
      puts "Please select column number between 1 and 7:\n"
      number = gets.to_i

      if !number.between?(1, 7)
        puts "Chosen number was not between 1 and 7.\n"
        next
      elsif @game.board[number].reject(&:nil?).length == 6
        puts "Chosen column is already full.\n"
        next
      else
        return number
      end
    end
  end
end
