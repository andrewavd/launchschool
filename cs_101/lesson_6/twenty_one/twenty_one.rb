# twenty-one
require 'pry'

SUITS = ['C', 'D', 'H', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def initialize_deck
  VALUES.product(SUITS).shuffle
end

game_deck = initialize_deck

game_deck.each { |card| print card }