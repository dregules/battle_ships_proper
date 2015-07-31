require_relative 'board'

class Player

  attr_reader :board

  def initialize(board_class)
    @board = board_class.new
  end

  def fire(position)
    if board.ships.keys.include?(position)
      board.collect_hits(position) #untested
      board.checks(position) #untested
      "Hit"
    else
      board.collect_misses(position)
      "Miss"
    end
  end

  def won?
    board.all_ships_sunk?
  end
end