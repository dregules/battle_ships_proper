require 'player'

describe Player do
  let (:board) { double :board, :collect_hits => "A2", :place_ship => "A2"}
  let (:player) { Player.new Board }
  let (:ship) { double :ship,  :size => 2, :get_hit => 1 }
  let (:unhit_ship) { double :unhit_ship, :hits => 0 }

  context "player fires" do
    it "should respond to fire and coordinates" do
      expect(player).to respond_to(:fire).with(1).argument
    end

    it "should return hit if player hits a ship" do
      player1 = Player.new Board
      player1.board.place_ship ship, :vertical, 'A2'
      expect(player1.fire "A2" ).to eq "Hit"
    end

    it "should return miss if player misses a ship" do
      player1 = Player.new Board
      player1.board.place_ship ship, :vertical, 'C3'
      expect(player.fire("A2")).to eq("Miss")
    end

    it 'should let the user know when losing/winning' do
      allow(board).to receive(:all_ships_sunk?) { true }
      expect(player.won?).to eq(true)
    end

  end
end