class Deck
  def initialize
    @cards = []
    implament_card
  end

  def implament_card
    (2..14).each do |value|
      ["h","d","c","s"].each do |symbol|
        @cards << Card.new(symbol,value)
      end
    end
    @cards.suffle
  end

  def pop_card
    @cards.pop
  end

end