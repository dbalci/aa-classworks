require "singleton"

class NullPiece < Piece
  attr_accessor :pos, :color
  include Singleton

  def initialize
    @color = :none
    @symbol = " "
  end

  def empty?
    true
  end
  
end