require_relative 'lib/deck'
require_relative 'lib/player'
require_relative 'lib/hand'


# Class definition for the Poker Game
class Game
  # Accessors for deck, players, current_player, and current_bet
  attr_reader :deck, :players, :current_player, :current_bet

  # Constructor method to initialize the game with a given number of players
  def initialize(num_players)
    @deck = Deck.new
    @players = []
    @current_player = 0
    @current_bet = 0
    create_players(num_players)
  end

  # Method to play a round of the game
  def play_round
    deal_cards
    betting_round
    discard_round
    betting_round
    reveal_hands
  end

  private
  # Method for the betting round
  def betting_round
    puts "Betting round begins."
    players.each do |player|
      puts "Player #{players.index(player) + 1}, it's now your turn to bet."
      puts "Current bet is #{@current_bet}."
      puts "Please select your action: [1] Fold, [2] See, [3] Raise"
      action = gets.chomp.to_i
      case action
      when 1
        player.fold
      when 2
        player.see(@current_bet)
      when 3
        raise_amount = player.raise_bet
        @current_bet += raise_amount
      else
        puts "Invalid action. Player automatically folds."
        player.fold
      end
    end
  end

  # Method for the discard round
  def discard_round
    puts "Discard round begins."
    players.each do |player|
      puts "Player #{players.index(player) + 1}, it's your turn to discard."
      player.discard(3)  # Assuming each player discards 3 cards for simplicity
    end
  end

  # Method to reveal hands and determine the winner
  def reveal_hands
    puts "Revealing hands."
    players.each_with_index do |player, index|
      hand_cards = player.hand.cards.map { |card| "#{card.value} of #{card.suit}" }
      puts "Player #{index + 1} hand: #{hand_cards.join(', ')}"
      puts "Player #{index + 1} hand strength: #{player.hand.evaluate}"
    end
    # Implement logic to determine the winner based on hand strength
    # For simplicity, let's assume the player with the highest hand strength wins
    winner = players.max_by { |player| player.hand.evaluate }
    puts "Player #{players.index(winner) + 1} wins the pot!"
  end

  # Method to create players with hands
  def create_players(num)
    num.times { @players << Player.new(Hand.new(deck.deal(5))) }
  end

  # Method to deal cards to players
  def deal_cards
    players.each do |player|
      player.hand = Hand.new(deck.deal(5))
    end
  end
end

# Main code to run the game
puts "Welcome to Five Card Draw Poker!"
puts "Please enter the amount of players."
num_players = gets.chomp.to_i
game = Game.new(num_players)
game.play_round
