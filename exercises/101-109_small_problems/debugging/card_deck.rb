# card_deck.rb
# October 2, 2018

# We started working on a card game but got stuck. Check out why the code below raises a
# TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's
# lower than it should be. Why is that?

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# .clone each of the suits of cards (cards.clone) to solve the sum issue of the deck (ln 53)
deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []

deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  p cards
  player_cards << cards.pop
  p cards
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, cards)|
  #cards.map do |card|
  deck_score = cards.map do |card| # use assignment to capture value.
    score(card)
  end

  #sum += cards.sum
  sum += deck_score.sum
end

puts "The player's hand: #{player_cards}"
puts "The sum of the deck: #{sum}, is incorrect because the value of the player's hand is being subtracted 4 times (each suit) from the deck total!"