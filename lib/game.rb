require_relative 'deck'
require_relative 'player'

class Game
  attr_reader :deck, :players, :current_player

  def initialize(num_players)
    @deck = Deck.new
    @players = []
    @current_player = 0
    create_players(num_players)
  end

  # Plays a round of the game
  def play_round
    deal_cards
    players.each do |player|
      player.discard(3)
      puts "Player hand: #{player.hand}"
    end
  end

  private

  # Creates players for the game
  def create_players(num)
    num.times { @players << Player.new(Hand.new(deck.deal(5))) }
  end

  # Deals cards to each player
  def deal_cards
    players.each do |player|
      player.hand = Hand.new(deck.deal(5))
    end
  end
end
