VALID_CHOICES = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard']

def initial_set
  {
    throws: 0,
    player_wins: 0,
    player_pct: 0.0,
    pc_wins: 0,
    pc_pct: 0.0,
    draws: 0,
    draw_pct: 0.0
  }
end

def initial_match
  {
    name: '',
    set_count: 1,
    player_set_wins: 0,
    pc_set_wins: 0,
    set_stats:  initial_set
  }
end

def prompt(message)
  print("=> #{message}")
end

def obtain_name
  prompt("What's your first name: ")
  gets.chomp.capitalize
end

def title_underscore(reps)
  reps.times { print('-') }
  puts
end

def display_title(title)
  puts
  puts(title.to_s)
  title_underscore(title.length)
end

def convert_player_input(player_input)
  player_input = 'k' if player_input == 'sp' || player_input == 'spock'
  throws = {
    r: "Rock",
    p: "Paper",
    s: "Scissors",
    k: "Spock",
    l: "Lizard",
    q: "Quit"
  }
  throws[player_input[0].to_sym]
end

def validate_player_input(player_input)
  if %w(r rock p paper s scissors
        sp spock l lizard q quit).include?(player_input)
    true
  else
    prompt("??? Please choose (R)ock, (P)aper," \
           " (S)cissors, (Sp)ock or (L)izard? ")
  end
end

def obtain_player_input
  player_input = ''
  valid_input = false
  puts
  prompt("(R)ock, (P)aper, (S)cissors, (Sp)ock, (L)izard? ")
  until valid_input
    player_input = gets().chomp().downcase
    valid_input = validate_player_input(player_input)
  end
  convert_player_input(player_input)
end

def obtain_computer_input
  VALID_CHOICES.sample
end

def display_set_score(stats)
  display_title('Current Set Results')
  puts("#{stats[:name]}: #{stats[:set_stats][:player_wins]} wins.")
  puts("Computer: #{stats[:set_stats][:pc_wins]} wins.")
  puts("Draws: #{stats[:set_stats][:draws]} ties.")
end

def display_match_score(stats)
  display_set_score(stats)
  display_title('Current Match Results')
  puts("Set # #{stats[:set_count]}")
  puts("#{stats[:name]}: #{stats[:player_set_wins]} wins.")
  puts("Computer: #{stats[:pc_set_wins]} wins.")
end

def who_wins?(player1, player2)
  win_matrix = {
    rock: ['scissors', 'lizard'],
    paper: ['rock', 'spock'],
    scissors: ['paper', 'lizard'],
    spock: ['scissors', 'rock'],
    lizard: ['paper', 'spock']
  }
  win_matrix[player1.downcase.to_sym].include?(player2.downcase)
end

def update_wins(players_throw, computers_throw, stats)
  if who_wins?(players_throw, computers_throw)
    stats[:set_stats][:player_wins] += 1
    game_winner = stats[:name]
  elsif who_wins?(computers_throw, players_throw)
    stats[:set_stats][:pc_wins] += 1
    game_winner = 'Computer'
  else
    stats[:set_stats][:draws] += 1
    game_winner = ''
  end
  game_winner
end

def display_winner(players_throw, computers_throw, stats)
  puts("#{stats[:name]}: #{players_throw} vs Computer: #{computers_throw}")
  game_winner = update_wins(players_throw, computers_throw, stats)
  game_winner == '' ? puts("It's a draw!") : puts("#{game_winner} wins!")
end

def calc_pct(stats, stat_pct)
  stats[:set_stats][stat_pct].to_f / stats[:set_stats][:throws] * 100
end

def update_stats(stats)
  stats[:set_stats][:throws] += 1
  stats[:set_stats][:player_pct] = calc_pct(stats, :player_wins)
  stats[:set_stats][:pc_pct] = calc_pct(stats, :pc_wins)
  stats[:set_stats][:draw_pct] = calc_pct(stats, :draws)
end

def display_sets_winner(stats)
  if stats[:set_stats][:player_wins] == 5
    stats[:player_set_wins] += 1
    puts("#{stats[:name]} wins set with 5 won throws!")
  elsif stats[:set_stats][:pc_wins] == 5
    stats[:pc_set_wins] += 1
    puts('Computer wins set with 5 won throws!')
  end
end

def display_sets_stats(stats)
  puts("Total throws in set: #{stats[:set_stats][:throws]}")
  puts("#{stats[:name]} win %: " \
    "#{format('%02.2f', stats[:set_stats][:player_pct])}%")
  puts("Computer win %: #{format('%02.2f', stats[:set_stats][:pc_pct])}%")
  puts("% Draws: #{format('%02.2f', stats[:set_stats][:draw_pct])}%")
end

def sets_winner?(stats)
  stats[:set_stats][:player_wins] == 5 || \
    stats[:set_stats][:pc_wins] == 5
end

def display_match_winner(stats)
  if stats[:player_set_wins] == 3
    puts("#{stats[:name]} wins match with 3 won sets!")
    puts("Game, Set and Match! Congratulations to #{stats[:name]}")
  elsif stats[:pc_set_wins] == 3
    puts('Computer wins match with 3 won sets!')
    puts('Game, Set and Match! Congratulations to the Computer')
  end
end

def match_winner?(stats)
  stats[:player_set_wins] == 3 || stats[:pc_set_wins] == 3
end

def end_match?
  puts
  prompt("Would you like to continue playing (Y/n)? ")
  gets().chomp().downcase() != 'y' ? true : false
end

stop_match = false
stats = initial_match
stats[:name] = obtain_name
player_name = stats[:name]

display_title("Welcome #{player_name} to #{VALID_CHOICES.join(', ')}!")
puts('(Q)uit to exit at any time.')
puts('First player to win 5 throws wins the set!')
puts('First player to win 3 sets wins the match!')

until stop_match
  players_throw = obtain_player_input
  break if players_throw == 'Quit'
  computers_throw = obtain_computer_input
  display_winner(players_throw, computers_throw, stats)
  update_stats(stats)
  display_match_score(stats)
  if sets_winner?(stats)
    display_title('Game and Set!')
    display_sets_winner(stats)
    display_sets_stats(stats)
    stats[:set_stats] = initial_set
    stats[:set_count] += 1
    if match_winner?(stats)
      display_match_winner(stats)
      stats = initial_match
      stats[:name] = player_name
    end
    stop_match = end_match?
  end
end

puts
puts('Thank you for playing... Good bye!')
puts
