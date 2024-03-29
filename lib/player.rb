require_relative 'hand'

class Player
  attr_accessor :hand, :pot

  def initialize(hand = nil, pot = 0)
    @hand = hand
    @pot = pot
  end

  # Allows the player to discard cards from their hand
  def discard(num)
    puts "Enter the positions of cards to be discarded (e.g., '1 2 3'): "
    positions = gets.chomp.split.map(&:to_i)
    positions.each { |pos| @hand.cards.delete_at(pos - 1) } # Adjust positions to match array indexing
  end

  # Player folds
  def fold
    puts "Player has folded."
  end

  # Player sees the current bet
  def see(current_bet)
    puts "Current bet is #{current_bet}."
  end

  # Player raises the bet
  def raise_bet
    puts "Enter desired amount to raise: "
    amount = gets.chomp.to_i
    puts "Player raises the bet by #{amount}."
    amount
  end
end
