# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:connect_four) { described_class.new }

  describe '#initialize' do
    it 'first player is a Human' do
      human_player = connect_four.instance_variable_get(:@player_one)
      expect(human_player).to be_a Human
    end

    it 'second player is a Computer' do
      computer_player = connect_four.instance_variable_get(:@player_two)
      expect(computer_player).to be_a Computer
    end
  end
end
