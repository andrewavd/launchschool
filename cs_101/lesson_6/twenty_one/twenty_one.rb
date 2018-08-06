# twenty-one
require 'pry'

SUITS = ['C', 'D', 'H', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

# outputs #

def prompt(message)
  print"=> #{message}"
end

def title_underscore(repetitions)
  repetitions.times { print'-' }
  puts ""
end

def output_title(title)
  puts "\n#{title}"
  title_underscore(title.length)
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def display_initial_dealer_hand(dealer)
  puts " ?? #{dealer[1]} "
end

def hand_total(player)
  total = 0
  ace = false
  player.each do |hand|
    case hand[0]
    when 'J', 'Q', 'K'
      total += hand[0].to_i + 10
    when 'A'
      ace = true
      total += hand[0].to_i + 11
    else
      total += hand[0].to_i
    end
  end
  busted?(total) && ace ? total -= 10 : total
end

def display_hand(player)
  player.each { |hand| print "#{hand} " }
  puts "Hand total: #{hand_total(player)}"
end

def obtain_move
  print "Would you like to hit or stand? "
  gets.chomp
end

def deal_card(player, game_deck)
  player << game_deck.pop
end

def busted?(total)
  total > 21
end

output_title("Twenty-One!")
game_deck = initialize_deck
# game_deck = [["A", "D"], ["K", "C"], ["6", "H"], ["A", "S"], ["Q", "S"]]
player1 = []
dealer = []
hand_over = false

2.times do
  player1 = deal_card(player1, game_deck)
  dealer = deal_card(dealer, game_deck)
end

output_title("Dealer's Hand")
display_initial_dealer_hand(dealer)
output_title("Player's Hand")
display_hand(player1)

loop do
  if obtain_move == 'hit'
    deal_card(player1, game_deck)
    display_hand(player1)
    if busted?(hand_total(player1))
      puts "Player busted...Dealer wins!"
      hand_over = true
      break
    end
  else
    break
  end
end

if !hand_over
  output_title("Dealer's Hand")
  display_hand(dealer)
  loop do
    break if hand_total(dealer) >= 17 && hand_total(dealer) <= 21
    deal_card(dealer, game_deck)
    display_hand(dealer)
    if busted?(hand_total(dealer))
      puts " Dealer busted...Player wins!"
      hand_over = true
      break
    end
  end
end

if !hand_over
  puts "Player total: #{hand_total(player1)}." \
  " Dealer total: #{hand_total(dealer)}."
  if hand_total(player1) > hand_total(dealer)
    puts "Player wins!"
  elsif hand_total(dealer) > hand_total(player1)
    puts "Dealer wins!"
  else
    puts "Hand is a push!"
  end
end
