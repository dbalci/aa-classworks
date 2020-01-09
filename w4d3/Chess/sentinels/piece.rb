# require "./sentinels/slideable.rb"
# require "./sentinels/stepable.rb"
# require "./sentinels/pawn.rb"
# require "./sentinels/null_piece.rb"

class Piece
  attr_accessor :color, :pos, :board
  def initialize(color,pos,board)
    @color = color
    @board = board
    @pos = pos
  end 

  
  def to_s
  
  end 

  def empty?
    false
  end 

  def valid_moves
  
  end 


  def symbol

  end 

  private
  def move_into_check?(end_pos)
  
  end 

end