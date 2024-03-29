require 'game.rb'

RSpec.describe Game do
  let(:num_players) { 4 }
  let(:game) { Game.new(num_players) } # Instantiate a game for testing

  describe "#initialize" do
    it "creates a new game with players and a deck" do
      # Test whether the game is initialized with a deck and the correct number of players
      expect(game.deck).to be_a(Deck)
      expect(game.players.size).to eq(num_players)
      expect(game.current_player).to eq(0)
    end
  end

  describe "#play_round" do
    it "deals cards to players and allows them to discard" do
      # Test whether the play_round method correctly deals cards and allows players to discard
      expect(game).to receive(:deal_cards).once
      game.players.each do |player|
        expect(player).to receive(:discard).once.with(3)
      end
      expect { game.play_round }.to output(/Player hand: .+/).to_stdout
    end
  end

  describe "#deal_cards" do
    it "deals 5 cards to each player" do
      # Test whether each player is dealt 5 cards
      game.players.each do |player|
        expect(player.hand.cards.size).to eq(5)
      end
    end
  end
end
