# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'

class Game
  def initialize
    @player_one = Human.new
    @player_two = Computer.new
  end
end
