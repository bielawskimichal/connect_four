# frozen_string_literal: true

require_relative '../lib/human'

describe Human do
  subject(:human_player) { described_class.new }

  describe '#to_s' do
    before do
      allow(human_player).to receive(:puts)
    end

    it 'should have correct marker' do
      expect(human_player).to receive(:puts).with('u26aa'.encode('utf-8'))
      puts human_player
    end
  end
end
