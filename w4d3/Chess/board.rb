#Chessboard
require_relative "./sentinels/piece.rb"
require_relative "./sentinels/null_piece.rb"

require "byebug"

class Board
  attr_accessor :rows


  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8){Array.new(8, @sentinal)}
    # @position = @sentinel.pos
    # self.add_piece(@sentinel,@position)
  end

  def [](pos)
    x,y = pos
    self.rows[x][y]
  end

  def []=(pos,value)
    x,y = pos
    self.rows[x][y] = value
  end

  def move_piece(color,start_pos,end_pos)
    debugger
    piece = self[start_pos]
    if piece.nil?
      raise "NoPieceAtSpot"
    end
    
    if valid_pos?(end_pos)
      raise "InvalidMoveSpot"
    end

    piece.pos = end_pos
    self[start_pos] = nil
    self[end_pos] = piece

  end

  def valid_pos?(pos)
    
    if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
      false
    end
    true
  end

  def add_piece(piece,pos)
    self[pos] = piece
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