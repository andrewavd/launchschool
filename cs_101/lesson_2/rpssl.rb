VALID_CHOICES = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard']
SET_WIN = 5
MATCH_WIN = 3

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
    throws: 0,
    player_set_wins: 0,
    player_total_wins: 0,
    player_total_pct: 0.0,
    pc_set_wins: 0,
    pc_total_wins: 0,
    pc_total_pct: 0.0,
    total_draws: 0,
    draw_total_pct: 0.0,
    set_stats:  initial_set
  }
end

def prompt(message)
  print("=> #{message}")
end

def validate_name(first_name)
  if first_name == '' || first_name.strip.empty?
    'Player One'
  else
    first_name.strip.capitalize
  end
end

def obtain_name
  prompt("What's your first name: ")
  validate_name(gets.chomp)
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
  display_title("Set #{stats[:set_count]} Score")
  puts("#{stats[:name]}: #{stats[:set_stats][:player_wins]} wins.")
  puts("Computer: #{stats[:set_stats][:pc_wins]} wins.")
  puts("Draws: #{stats[:set_stats][:draws]} ties.")
end

def display_match_score(stats)
  display_title("Match Score")
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
  puts
  puts("#{stats[:name]}: #{players_throw} vs Computer: #{computers_throw}")
  game_winner = update_wins(players_throw, computers_throw, stats)
  game_winner == '' ? puts("It's a draw!") : puts("#{game_winner} wins!")
end

def calc_pct(key, stat_pct)
  key[stat_pct].to_f / key[:throws] * 100
end

def update_set_stats(stats)
  stats[:set_stats][:throws] += 1
  stats[:set_stats][:player_pct] = calc_pct(stats[:set_stats], :player_wins)
  stats[:set_stats][:pc_pct] = calc_pct(stats[:set_stats], :pc_wins)
  stats[:set_stats][:draw_pct] = calc_pct(stats[:set_stats], :draws)
end

def display_sets_winner(stats)
  if stats[:set_stats][:player_wins] == SET_WIN
    stats[:player_set_wins] += 1
    puts("#{stats[:name]} wins set with #{SET_WIN} won throws!")
  elsif stats[:set_stats][:pc_wins] == SET_WIN
    stats[:pc_set_wins] += 1
    puts("Computer wins set with #{SET_WIN} won throws!")
  end
end

def display_sets_stats(stats)
  display_title('Game and Set!')
  puts("Total throws in set #{stats[:set_count]}:" \
    " #{stats[:set_stats][:throws]}")
  puts("#{stats[:name]} win %: " \
    "#{format('%02.2f', stats[:set_stats][:player_pct])}%")
  puts("Computer win %: #{format('%02.2f', stats[:set_stats][:pc_pct])}%")
  puts("% Draws: #{format('%02.2f', stats[:set_stats][:draw_pct])}%")
end

def update_match_stats(stats)
  stats[:throws] += stats[:set_stats][:throws]
  stats[:player_total_wins] += stats[:set_stats][:player_wins]
  stats[:pc_total_wins] += stats[:set_stats][:pc_wins]
  stats[:total_draws] += stats[:set_stats][:draws]
  stats[:player_total_pct] = calc_pct(stats, :player_total_wins)
  stats[:pc_total_pct] = calc_pct(stats, :pc_total_wins)
  stats[:draw_total_pct] = calc_pct(stats, :total_draws)
end

def sets_winner?(stats)
  stats[:set_stats][:player_wins] == SET_WIN || \
    stats[:set_stats][:pc_wins] == SET_WIN
end

def display_match_winner(stats)
  display_title('Game, Set and Match!')
  if stats[:player_set_wins] == MATCH_WIN
    puts("#{stats[:name]} wins match: #{MATCH_WIN}" \
      " sets to #{stats[:pc_set_wins]}!")
    puts("Congratulations to #{stats[:name]}!")
  elsif stats[:pc_set_wins] == MATCH_WIN
    puts("Computer wins match: #{MATCH_WIN}" \
      " sets to #{stats[:player_set_wins]}!")
    puts('Congratulations to the Computer!')
  end
end

def display_match_stats(stats)
  puts("Total throws in match: #{stats[:throws]}")
  puts("#{stats[:name]} win %: " \
    "#{format('%02.2f', stats[:player_total_pct])}%")
  puts("Computer win %: #{format('%02.2f', stats[:pc_total_pct])}%")
  puts("% Draws: #{format('%02.2f', stats[:draw_total_pct])}%")
end

def match_winner?(stats)
  stats[:player_set_wins] == MATCH_WIN || stats[:pc_set_wins] == MATCH_WIN
end

def end_match?
  puts
  prompt("Would you like to continue playing (Y/n)? ")
  gets().chomp().downcase() != 'y'
end

stop_match = false
stats = initial_match
stats[:name] = obtain_name
player_name = stats[:name]

display_title("Welcome #{player_name} to #{VALID_CHOICES.join(', ')}!")
puts('(Q)uit to exit at any time.')
puts("First player to win #{SET_WIN} throws wins the set!")
puts("First player to win #{MATCH_WIN} sets wins the match!")

until stop_match
  players_throw = obtain_player_input
  break if players_throw == 'Quit'
  computers_throw = obtain_computer_input
  display_winner(players_throw, computers_throw, stats)
  update_set_stats(stats)
  display_set_score(stats)
  if sets_winner?(stats)
    display_sets_winner(stats)
    display_sets_stats(stats)
    update_match_stats(stats)
    stats[:set_stats] = initial_set
    stats[:set_count] += 1
    if match_winner?(stats)
      display_match_winner(stats)
      display_match_stats(stats)
      stats = initial_match
      stats[:name] = player_name
    end
    stop_match = end_match?
    if !stop_match
      display_match_score(stats)
    end
  end
end

puts
puts('Thank you for playing... Good bye!')
puts
