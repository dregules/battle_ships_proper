require 'game'

describe Game do
	let(:player) { double :player, :board => board}
	let(:playerClass) { double :Player, new: player }
	let(:board) { double :board, :all_ships_sunk? => true}
	let(:boardClass) { double :Board, new: board }

	subject { Game.new playerClass, playerClass }

	it "responds to game over" do
		expect(subject).to respond_to(:game_over?)
	end

	it "say game is over when 5 ships are sunk" do
		allow(player.board).to receive(:all_ships_sunk?).with(true)
		expect(subject.game_over?).to eq(true)
	end


end