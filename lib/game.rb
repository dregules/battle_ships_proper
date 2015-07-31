require_relative 'player'

class Game

	attr_reader :player1, :player2

	def initialize (player1_class, player2_class)
		@game_over = false
		@player1 = player1_class.new Board
		@player2 = player2_class.new Board
	end

	def game_over?
		player1.board.all_ships_sunk? || player2.board.all_ships_sunk?
	end

end