require_relative 'board'

class Player

  attr_reader :board
  attr_accessor :name

  def initialize(board_class, name)
    @board = board_class.new
    @name = name
  end

  def fire(position)

    if position_in_board?(position)
      "You won!" if won?
      board.collect_hits(position)
      board.checks(position)
      "Hit"
    else
      board.collect_misses(position)
      "Miss"
    end
  end

  def self.name name
    Player.new Board, name
  end

  def position_in_board?(position)
    board.ships.keys.include?(position)
  end

  def won?
    board.all_ships_sunk?
  end
end