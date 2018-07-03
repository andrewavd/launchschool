VALID_CHOICES = ['Rock', 'Paper', 'Scissors']

def prompt(message)
  print("=> #{message}")
end

def convert_player_input(player_input)
  if player_input.start_with?('r')
    'Rock'
  elsif player_input.start_with?('p')
    'Paper'
  else
    'Scissors'
  end
end

def validate_player_input(player_input)
  if %w(r rock p paper s scissors).include?(player_input)
    true
  else
    prompt("??? Please choose (R)ock, (P)aper or (S)cissors? ")
  end
end

def obtain_player_input
  player_input = ''
  valid_input = false
  until valid_input
    player_input = gets().chomp().downcase
    valid_input = validate_player_input(player_input)
  end
  player_input
end

def obtain_computer_input
  VALID_CHOICES.sample
end

def who_wins?(player1, player2)
  (player1 == 'Rock' && player2 == 'Scissors') ||
    (player1 == 'Paper' && player2 == 'Rock') ||
    (player1 == 'Scissors' && player2 == 'Paper')
end

def display_winner(players_choice, computers_choice)
  if who_wins(players_choice, computers_choice)
    puts("Player wins!")
  elsif who_wins?(computer_choice, player_choice)
    puts("Computer wins!")
  else
    puts("It's a tie!")
  end
end

def end_game?
  prompt("Would you like to play again (Y/n)? ")
  end_game = gets().chomp().downcase()
  end_game != 'y' ? true : false
end

terminate_game = false
puts("Welcome to #{VALID_CHOICES.join(', ')}!")

until terminate_game
  prompt("(R)ock, (P)aper, (S)cissors? ")
  players_choice = convert_player_input(obtain_player_input)
  computers_choice = obtain_computer_input
  puts("Player: #{players_choice} vs Computer: #{computers_choice}")
  display_winner(players_choice, computers_choice)
  terminate_game = end_game?
end
