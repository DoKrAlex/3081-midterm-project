require 'deck.rb'

RSpec.describe Deck do
  let(:deck) { Deck.new } # Instantiate a deck for testing

  describe "#initialize" do
    it "generates a new deck with 52 cards" do
      # Test whether the deck is initialized with 52 cards
      expect(deck.cards.size).to eq(52)
    end

    it "shuffles the deck" do
      # Test whether the deck is shuffled by comparing it with a newly instantiated deck
      shuffled_deck = Deck.new.cards
      expect(shuffled_deck).not_to eq(deck.cards)
    end
  end

  describe "#deal" do
    it "deals specified number of cards from the deck" do
      # Test whether dealing the specified number of cards returns the expected number of cards
      dealt_cards = deck.deal(5)
      expect(dealt_cards.size).to eq(5)
    end

    it "removes cards from the deck that have been dealt" do
      # Test whether dealt cards are removed from the deck and not present in the deck after dealing
      initial_deck_size = deck.cards.size
      dealt_cards = deck.deal(5)
      expect(deck.cards.size).to eq(initial_deck_size - 5)
      dealt_cards.each { |card| expect(deck.cards).not_to include(card) }
    end
  end
end
