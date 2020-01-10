class Card
  attr_reader :symbol, :value
  def initialize(symbol, value)
    @symbol = symbol
    @value = value
  end

  def print_symbol
    h = { "h" => ♥️, "d" => ♦️, "c" => ♣️, "s" => ♠️ } 
    h[@symbol]
  end

  def to_s
    "(#{print_symbol}  #{@value})"
  end
end