require 'player.rb'

RSpec.describe Player do
  let(:hand) { Hand.new([Card.new("Hearts", "Ace"), Card.new("Diamonds", "King"), Card.new("Clubs", "Queen")]) }
  let(:player) { Player.new(hand, 100) }

  describe "#initialize" do
    it "creates a new player with a hand and pot" do
      expect(player.hand).to eq(hand)
      expect(player.pot).to eq(100)
    end
  end

  describe "#discard" do
    it "discards selected cards from the hand" do
      allow(player).to receive(:gets).and_return("1 2")
      player.discard(2) # Pass the number of cards to discard
      expect(player.hand.cards.size).to eq(1)
    end
  end


  describe "#fold" do
    it "outputs a message indicating the player folds" do
      expect { player.fold }.to output("Player has folded.\n").to_stdout
    end
  end

  describe "#see" do
    it "outputs the current bet" do
      expect { player.see(50) }.to output("Current bet is 50.\n").to_stdout
    end
  end

  describe "#raise_bet" do
    it "returns the amount raised by the player" do
      allow(player).to receive(:gets).and_return("40")
      expect { player.raise_bet }.to output("Enter desired amount to raise: \nPlayer raises the bet by 40.\n").to_stdout
    end
  end
end
