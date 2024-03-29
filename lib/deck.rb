require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = generate_deck.shuffle
  end

  def deal(num)
    cards.shift(num)
  end

  private

  # Generates a standard deck of 52 playing cards
  def generate_deck
    suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    suits.product(values).map { |suit, value| Card.new(suit, value) }
  end
end
