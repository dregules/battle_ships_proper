require_relative 'board'

class Player

  attr_reader :board

  def initialize(board_class)
    @board = board_class.new
  end

  def fire(position)
    if position_in_board?(position)
      board.collect_hits(position)
      board.checks(position)
      "Hit" 
      "You won!" if won? 
    else
      board.collect_misses(position)
      "Miss"
    end
  end

  def position_in_board?(position)
    board.ships.keys.include?(position)
  end

  def won?
    board.all_ships_sunk?
  end
end