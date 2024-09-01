# frozen_string_literal: true

require_relative 'player'

class Computer < Player
  def initialize
    super
    @marker = create_marker('b')
  end
end
