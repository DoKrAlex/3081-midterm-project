require_relative 'card'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  # Evaluates the hand, for now just returns the number of cards in the hand
  def evaluate
    @cards.size
  end
end
