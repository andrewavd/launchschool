# twenty-one

HIT_STAND = "Would you like to (h)it or (s)tand? "
HIT_STAND_ERR = "??? Please enter (h)it or (s)tand: "
MOVE_TEST = ['h', 'hit', 's', 'stand']
PLAY_AGAIN = "Would you like to play again, (y)es or (n)o? "
DEAL_AGAIN = "Deal again, (y)es or (n)o? "
PLAY_AGAIN_ERR = "??? Please enter (y)es or (n)o: "
YES_NO_TEST = ['y', 'yes', 'n', 'no']
SUITS = %w[C D H S]
VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
TARGET = 21
HOLD = 17
CREDITS = 5

# outputs #
def prompt(message)
  print"\n=> #{message}"
end

def title_underscore(repetitions)
  puts("-" * repetitions)
end

def output_title(title)
  puts "\n#{title}"
  title_underscore(title.length)
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def display_initial_dealer_hand(dealer)
  puts " ?? #{dealer[1][0]}#{dealer[1][1]}"
end

def twentyone?(total)
  total == TARGET
end

def busted?(total)
  total > TARGET
end

def hi_low_ace(hand, total)
  if total > 10
    hand[0].to_i + 1
  else
    hand[0].to_i + 11
  end
end

def hand_total(player)
  total = 0
  hold_aces = false
  player.each do |hand|
    case hand[0]
    when 'J', 'Q', 'K'
      total += hand[0].to_i + 10
    when 'A'
      hold_aces = true
      total += hi_low_ace(hand, total)
    else
      total += hand[0].to_i
    end
  end
  busted?(total) && hold_aces ? total -= 10 : total
end

def display_hand(player, total)
  player.each { |hand| print "#{hand[0]}#{hand[1]} " }
  puts "Hand total: #{total}"
end

def yes?(move)
  %w[y yes].include?(move)
end

def hit?(move)
  'hit' if %w[h hit].include?(move)
end

def validate_input(test_all, move)
  test_all.include?(move)
end

def obtain_input(test_all, input_msg, err_msg)
  prompt(input_msg)
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

def determine_winner(player, dealer)
  if player > dealer
    :player_wins
  elsif dealer > player
    :delaer_wins
  else
    :push
  end
end

score = CREDITS

loop do
  system 'clear'
  output_title("Twenty-One!")
  game_deck = initialize_deck
  player1 = []
  dealer = []
  hand_over = false

  # initial deal
  2.times do
    player1 = deal_card(player1, game_deck)
    dealer = deal_card(dealer, game_deck)
  end

  player1_total = hand_total(player1)
  dealer_total = hand_total(dealer)

  output_title("Dealer's Hand")
  display_initial_dealer_hand(dealer)
  output_title("Player's Hand")
  display_hand(player1, player1_total)

  # Does anyone have 21 on initial deal?
  if twentyone?(player1_total) || twentyone?(dealer_total)
    case determine_winner(player1_total, dealer_total)
    when :push
      output_title("Dealer's Hand")
      display_hand(dealer, dealer_total)
      output_title("Player has 21! Dealer has 21! Hand is a push")
    when :player_wins
      output_title("Dealer's Hand")
      display_hand(dealer, dealer_total)
      output_title("21! Player wins!")
      score += 1
      puts "Player credits = #{score}."
    when :delaer_wins
      output_title("21! Dealer wins!")
      puts "Dealer's Hand"
      display_hand(dealer, dealer_total)
      score -= 1
      puts "\nPlayer credits = #{score}."
    end
    hand_over = true
  end

  # player's turn
  if !hand_over
    loop do
      if hit?(obtain_input(MOVE_TEST, HIT_STAND, HIT_STAND_ERR)) == 'hit'
        deal_card(player1, game_deck)
        player1_total = hand_total(player1)
        display_hand(player1, player1_total)
      else
        break
      end
      break if twentyone?(player1_total)
      if busted?(player1_total)
        output_title("Player busted...Dealer wins!")
        score -= 1
        puts "Player credits = #{score}."
        hand_over = true
        break
      end
    end
  end

  # dealer's turn
  if !hand_over
    output_title("Dealer's Hand")
    display_hand(dealer, dealer_total)
    loop do
      break if dealer_total >= HOLD && dealer_total <= TARGET
      deal_card(dealer, game_deck)
      dealer_total = hand_total(dealer)
      display_hand(dealer, dealer_total)
      if busted?(dealer_total)
        output_title("Dealer busted...Player wins!")
        score += 1
        puts "Player credits = #{score}."
        hand_over = true
        break
      end
    end
  end

  if !hand_over
    case determine_winner(player1_total, dealer_total)
    when :player_wins
      output_title("Player wins!")
      score += 1
    when :delaer_wins
      output_title("Dealer wins!")
      score -= 1
    when :push
      output_title("Hand is a push!")
    end
    puts "Player total: #{player1_total}." \
    " Dealer total: #{dealer_total}."
    puts "Player credits = #{score}."
  end

  if score == 0
    if yes?(obtain_input(YES_NO_TEST, PLAY_AGAIN, PLAY_AGAIN_ERR))
      score = CREDITS
    else
      break
    end
  elsif !yes?(obtain_input(YES_NO_TEST, DEAL_AGAIN, PLAY_AGAIN_ERR))
    break
  end
end

puts "Thank you for playing Twenty-One. Good bye."
