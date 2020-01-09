require_relative "piece.rb"
class Pawn < Piece
  attr_reader :symbol
  def initialize(color,pos)
    super
  end 

  def move_dirs
    moves = []
    x,y = pos
    if at_start_row?
      new_pos = x,y + 2*self.forward_dir
      moves << new_pos
    else
      moves << forward_steps
      moves << side_attacks
    end
    moves.select do |move|
      board.valid_pos?(move) && board[move].empty? || board[move].color != self.color && board.valid_pos?(move)
    end
  end

  def symbol
    @symbol = :pawn
  end

  # private
  def at_start_row?
    return true if self.color == :w && self.pos[1] == 1
    return true if self.color == :b && self.pos[1] == 6
    false
  end

  def forward_dir
    if self.color == :w
      return 1
    else
      return -1
    end
  end

  def forward_steps
    x,y = pos
    new_pos = x,y + self.forward_dir
  end

  def right_attack
    right_pos = [pos[0]+1, pos[1]+forward_dir]
  end

  def left_attack
    left_pos = [pos[0]-1, pos[1]+forward_dir]
  end
  
  def side_attacks
    side_attack = []
    side_attack << left_attack 
    side_attack << right_attack
  end
end