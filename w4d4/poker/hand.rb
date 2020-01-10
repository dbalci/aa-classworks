require_relative "Deck"
class Hand
  def initialize(deck)
    @deck = deck
    @per_hand = []
    @first = self.first_hand
  end

  def first_hand
    5.times do 
      @per_hand << @deck.pop
    end
  end

  def discard_card(card)
    raise "You don' have this card" if @per_hand.include?(card)

    @per_hand.delete(card)
    @per_hand << @deck.pop_card
  end

  def straight?
    #we call value from the hand for each card and order them
    #(max-min) == 4 
    values = @per_hand.map{|card| card.value}
    values.max - values.min == 4

  end

  def flush?

  end

  def four_of_a_kind?

  end

  def full_house?

  end

  def three_of_a_kind?

  end

  def two_pair?

  end

  def one_pair?

  end



end