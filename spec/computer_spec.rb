# frozen_string_literal: true

require_relative '../lib/computer'

describe Computer do
  subject(:computer_player) { described_class.new }

  describe '#to_s' do
    before do
      allow(computer_player).to receive(:puts)
    end

    it 'should have correct marker' do
      expect(computer_player).to receive(:puts).with('u26ab'.encode('utf-8'))
      puts computer_player
    end
  end
end
