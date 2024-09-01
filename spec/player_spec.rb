# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new }

  describe '#create_marker' do
    it 'should return correct marker' do
      expect(player.create_marker('a')).to eq('u26aa'.encode('utf-8'))
    end
  end
end
