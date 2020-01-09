require_relative "piece.rb"
module Stepable

  def moves
    moves = []
    move_diffs.each do |dif|
      dx,dy = dif
      currentx, currenty = pos
      new_pos = [dx+currentx, dy+currenty]
      if board.valid_pos?(new_pos) && board[new_pos].empty? 
        moves << new_pos
      elsif board[new_pos].color != self.color && board.valid_pos?(new_pos)
        moves << new_pos
      end
    end
    moves
  end

  def move_diffs
    raise NotImplemntedError
  end

end

class Knight < Piece
  include Stepable
  def initialize
    super
  end

  def symbol
    @symbol = :Knight
  end

  def move_diffs
    [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  end

end

class King < Piece
  include Stepable
  def initialize
    super
  end

  def symbol
    @symbol = :King
  end

  def move_diffs
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[-1,1],[1,-1]]
  end

end