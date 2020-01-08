#Chessboard
require "./piece.rb"
class Board
  def initialize(sentinel)
    @rows = Array.new(8){Array.new(8)}
    @sentinel = sentinel
    @rows.each.with_index do |row,r|
      if r == 0 || r == 7
        row.each.with_index do |col,c|
          self.add_piece(@sentinal,[r,c])
        end
      end

    end
  end

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @rows[x][y] = value
  end

  def move_piece(color,start_pos,end_pos)
  end

  def add_piece(piece,pos)
    @rows[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color,start_pos,end_pos)

  end
end