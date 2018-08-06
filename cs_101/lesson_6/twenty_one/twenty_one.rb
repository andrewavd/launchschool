# twenty-one

HIT_OR_STAND = "Would you like to (h)it or (s)tand? "
HIT_STAND_ERR = "??? Please enter (h)it or (s)tand: "
MOVE_TEST = ['h', 'hit', 's', 'stand']
PLAY_AGAIN = "Would you like to play again, (y)es or (n)o? "
PLAY_AGAIN_ERR = "??? Please enter (y)es or (n)o: "
YES_NO_TEST = ['y', 'yes', 'n', 'no']
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

def yes_or_no?(move)
  'yes' if %w[y yes].include?(move)
end

def hit_or_stand?(move)
  'hit' if %w[h hit].include?(move)
end

def validate_input(test_all, move)
  test_all.include?(move)
end

def obtain_input?(test_all, input_msg, err_msg)
  print input_msg
  move = gets.chomp.downcase
  until validate_input(test_all, move)
    puts err_msg
    move = gets.chomp.downcase
  end
  move
end

def deal_card(player, game_deck)
  player << game_deck.pop
end

def busted?(total)
  total > 21
end

game_over = false

until game_over

  system 'clear'

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
    if hit_or_stand?(obtain_input?(MOVE_TEST, HIT_OR_STAND, HIT_STAND_ERR)) == 'hit'
      deal_card(player1, game_deck)
      display_hand(player1)
      if busted?(hand_total(player1))
        output_title("Player busted...Dealer wins!")
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
        output_title(" Dealer busted...Player wins!")
        hand_over = true
        break
      end
    end
  end

  if !hand_over
    if hand_total(player1) > hand_total(dealer)
      output_title("Player wins!")
    elsif hand_total(dealer) > hand_total(player1)
      output_title("Dealer wins!")
    else
      output_title("Hand is a push!")
    end
    puts "Player total: #{hand_total(player1)}." \
    " Dealer total: #{hand_total(dealer)}."
  end

  if yes_or_no?(obtain_input?(YES_NO_TEST, PLAY_AGAIN, PLAY_AGAIN_ERR)) == 'yes'
    game_over = false
  else
    game_over = true
  end
end

puts "Thank you for playing Twenty-One. Good bye."
