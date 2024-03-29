require 'card.rb'

RSpec.describe Card do
  describe "#initialize" do
    it "generates a new card with suit and value" do
      # Test whether Card initialization sets suit and value correctly
      card = Card.new("Spades", "Diamonds")
      expect(card.suit).to eq("Spades")
      expect(card.value).to eq("Diamonds")
    end
  end

  describe "#to_s" do
    it "returns the string representation of the card" do
      # Test whether the to_s method returns the expected string representation
      card = Card.new("Spades", "Ace")
      expect(card.to_s).to eq("Ace of Spades")
    end
  end
end
