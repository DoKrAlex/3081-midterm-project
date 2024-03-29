require 'hand.rb' # Require the Hand class to be tested

RSpec.describe Hand do
  # Define sample cards with modified suits and values for testing
  let(:cards) { [Card.new("Spades", "10"), Card.new("Hearts", "Jack"), Card.new("Diamonds", "7")] }
  let(:hand) { Hand.new(cards) } # Instantiate a hand for testing

  describe "#initialize" do
    it "creates a new hand with cards" do
      # Test whether the hand is initialized with the provided cards
      expect(hand.cards).to eq(cards)
    end
  end

  describe "#evaluate" do
    it "returns the number of cards in the hand" do
      # Test whether the evaluate method returns the correct number of cards in the hand
      expect(hand.evaluate).to eq(3)
    end
  end
end
