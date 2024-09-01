# frozen_string_literal: true

require_relative 'player'

class Human < Player
  def initialize
    super
    @marker = create_marker('a')
  end
end
