require_relative "piece.rb"
module Slideable
  HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[-1,1],[1,-1]]
  
  def move_dirs
    raise NotImplemntedError
  end
  
  def moves
    moves = []
    move_dirs.each do |dirs|
      dx,dy = dirs
      currentx, currenty = pos
      new_pos = [dx+currentx, dy+currenty]
      until !board.valid_pos?(new_pos)
        if board[new_pos].color != self.color
          moves << new_pos
          break
        elsif board[new_pos].color == self.color
          break 
        else
          moves << new_pos
          currentx, currenty = new_pos
          new_pos = [dx+currentx, dy+currenty]
        end
      end
    end
    moves
  end
end

class Rook < Piece
  include Slideable

  def initialize
    super
  end

  def symbol
    @symbol = :Rook
  end

  def move_dirs
    HORIZONTAL_DIRS
  end
end

class Bishop < Piece
  include Slideable

  def initialize
    super
  end

  def symbol
    @symbol = :Bishop
  end

  def move_dirs
    DIAGONAL_DIRS
  end
end

class Queen < Piece
  include Slideable

  def initialize
    super
  end

  def symbol
    @symbol = :Queen
  end

  def move_dirs
    DIAGONAL_DIRS + HORIZONTAL_DIRS
  end
end
