# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:connect_four) { described_class.new }

  describe '#initialize' do
    it 'first player is a Player' do
      first_player = connect_four.instance_variable_get(:@player_one)
      expect(first_player).to be_a Player
    end

    it 'second player is a Player' do
      second_player = connect_four.instance_variable_get(:@player_two)
      expect(second_player).to be_a Player
    end
  end

  describe '#player_wins?' do
    context 'there are 4 player markers next to eachother' do
      before do
        player = connect_four.instance_variable_get(:@player_one)
        allow(player).to receive(:gets).exactly(4).times.and_return(1, 1, 1, 1)
      end

      it 'returns true' do
        player = connect_four.instance_variable_get(:@player_one)
        4.times { connect_four.update_board(player) }
        expect(connect_four.player_wins?(player)).to be true
      end
    end

    context 'there are 4 player markers next to eachother in a row' do
      before do
        player = connect_four.instance_variable_get(:@player_one)
        allow(player).to receive(:gets).exactly(4).times.and_return(1, 2, 3, 4)
      end

      it 'returns true' do
        human = connect_four.instance_variable_get(:@player_one)
        4.times { connect_four.update_board(human) }
        expect(connect_four.player_wins?(human)).to be true
      end
    end
  end

  describe '#update_board' do
    context 'player places only one marker' do
      before do
        human = connect_four.instance_variable_get(:@player_one)
        allow(human).to receive(:gets).and_return(3)
      end

      it 'places player marker in third column in first row' do
        human = connect_four.instance_variable_get(:@player_one)
        board = connect_four.instance_variable_get(:@board)
        expect { connect_four.update_board(human) }.to change { board[3][1] }.from(nil).to(human.marker)
      end
    end

    context 'player places two markers' do
      before do
        human = connect_four.instance_variable_get(:@player_one)
        allow(human).to receive(:gets).exactly(2).times.and_return(3, 3)
      end

      it 'places player marker in third column in first and second row' do
        human = connect_four.instance_variable_get(:@player_one)
        board = connect_four.instance_variable_get(:@board)
        i = 1
        2.times do
          expect { connect_four.update_board(human) }.to change { board[3][i] }.to(human.marker)
          i += 1
        end
      end
    end
  end

  describe '#current player' do
    it 'returns player with id 1' do
      human = connect_four.instance_variable_get(:@player_one)
      expect(connect_four.current_player).to eq(human)
    end
  end

  describe '#switch_players!' do
    it 'changes current player id' do
      expect { connect_four.switch_players! }.to change {
        connect_four.instance_variable_get(:@current_player_id)
      }.from(0).to(1)
    end
  end
end
