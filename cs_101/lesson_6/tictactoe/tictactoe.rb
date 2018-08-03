# Tic Tac Toe
require 'yaml'

BOARD_SIZE = 3
BOARD_ROW = "     -----+-----+-----"
BOARDCOLUMN = "          |     |"
INTRO = YAML.load_file('tournament_ttt_intro.yml')
PLAYER1_MARK = 'X'
PLAYER2_MARK = 'O'
MATCH_WIN = 5
GAME_TITLE = 'Tournament Tic Tac Toe'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def initialize_match
  {
    player1: { name: '', mark: PLAYER1_MARK },
    player2: { name: 'Computer', mark: PLAYER2_MARK },
    two_player: false,
    current_player: { name: '', mark: PLAYER1_MARK },
    skill_level: ''
  }
end

def initialize_stats
  {
    game_winner: nil,
    player1_wins: 0,
    player2_wins: 0,
    draws: 0
  }
end

# obtain and validate game setup parameters from user methods #

def validate_name(first_name, player_number)
  if first_name == '' || first_name.strip.empty?
    "#{player_number.capitalize}player"
  else
    first_name.strip.capitalize
  end
end

def obtain_name(player_number)
  prompt("Please enter #{player_number} player name: ")
  validate_name(gets.chomp, player_number)
end

def validate_first_player(roster)
  if roster[:current_player][:name] == roster[:player1][:name] ||
     roster[:current_player][:name] == roster[:player2][:name]
    true
  else
    prompt("#{roster[:current_player]} ??? I'm not sure who that is. Please" \
          "  choose #{roster[:player1][:name]} or #{roster[:player2][:name]}: ")
  end
end

def who_goes_first?(roster)
  valid_input = false
  prompt("Choose who goes first: (#{roster[:player1][:name]}" \
        " or #{roster[:player2][:name]}) ")
  until valid_input
    roster[:current_player][:name] = gets.chomp.capitalize
    valid_input = validate_first_player(roster)
  end
  if roster[:current_player][:name] == roster[:player1][:name]
    roster[:current_player][:mark] = PLAYER1_MARK
  else
    roster[:current_player][:mark] = PLAYER2_MARK
  end
end

def validate_skill_level(skill_level)
  if %w[n novice s skilled].include?(skill_level)
    true
  else
    prompt("??? Please enter (n)ovice or (s)killed: ")
  end
end

def obtain_skill_level
  skill_level = ''
  valid_input = false
  prompt("What skill level do you want the Computer" \
    " to play at: (n)ovice or (s)killed? ")
  until valid_input
    skill_level = gets.chomp.downcase
    valid_input = validate_skill_level(skill_level)
  end
  %w[n novice].include?(skill_level) ? 'novice' : 'skilled'
end

def validate_num_of_players(num_of_players)
  if %w[1 o one 2 t two].include?(num_of_players)
    true
  else
    prompt("??? Please choose 1) (o)ne or 2) (T)wo: ")
  end
end

def obtain_num_of_players
  num_of_players = 'one'
  valid_input = false
  prompt("(o)ne or (t)wo players? ")
  until valid_input
    num_of_players = gets.chomp.downcase
    valid_input = validate_num_of_players(num_of_players)
  end
  num_of_players
end

def two_players?
  %w[2 t two].include?(obtain_num_of_players) ? true : false
end

def validate_game_format(game_format)
  if %w[t tournament s single].include?(game_format)
    true
  else
    prompt("??? Please choose tournament or single: ")
  end
end

def tournament_or_single?
  game_format = ''
  valid_input = false
  prompt("Choose format: (T)ournament or (S)ingle? ")
  until valid_input
    game_format = gets.chomp.downcase
    valid_input = validate_game_format(game_format)
  end
  game_format.start_with?("t") ? true : false
end

## Repetitive output methods ##

def title_underscore(repetitions)
  print '  '
  repetitions.times { print"-" }
  puts ""
end

def display_title(title)
  puts ""
  print '  '
  puts title.to_s
  title_underscore(title.length)
  puts ""
end

def prompt(message)
  puts ""
  print "=> #{message}"
end

## Game Board methods ##

def calc_board(brd)
  BOARD_SIZE.times do |x|
    puts BOARD_ROW if x.odd?
    puts BOARDCOLUMN
    puts "       #{brd[3 * x + 1]}  |  #{brd[3 * x + 2]}  |  #{brd[3 * x + 3]}"
    puts BOARDCOLUMN
    puts BOARD_ROW if x.odd?
  end
end

def display_board(brd)
  system 'clear'
  display_title('Tournament Tic Tac Toe')
  calc_board(brd)
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

def update_board(brd, move, roster)
  brd[move] = if roster[:current_player][:name] == roster[:player1][:name]
                roster[:player1][:mark]
              else
                roster[:player2][:mark]
              end
end

# Player_1/Player_2 move methods #

def display_last_move(move)
  puts "Square #{move} is the last move available..."
  puts "I'll fill it in for you."
  sleep 2
end

def joinor(arr, seperator = ', ', conjunction = "or")
  case arr.size
  when 1 then arr.first
  when 2 then arr.join(" #{conjunction} ")
  else
    arr[-1] = "#{conjunction} #{arr.last}"
    arr.join(seperator)
  end
end

def obtain_player_move(brd, move, roster)
  valid_move = false
  prompt("#{roster[:current_player][:name]} choose a square" \
    " (#{joinor(validate_move(brd))}): ")
  until valid_move
    move = gets.chomp.to_i
    if validate_move(brd).include?(move)
      valid_move = true
    else
      puts("That square is unavailable.")
    end
  end
  move
end

def validate_move(brd)
  brd.keys.select { |num| brd[num] != PLAYER1_MARK && brd[num] != PLAYER2_MARK }
end

def player_move!(brd, roster)
  move = validate_move(brd)[0]
  if validate_move(brd).size == 1
    display_last_move(move)
  else
    move = obtain_player_move(brd, move, roster)
  end
  update_board(brd, move, roster)
end

# Computer move methods #

def thinking(brd)
  if validate_move(brd).size != 1
    puts "Computer thinking..."
    sleep 1
  end
end

def random_move(brd, roster)
  move = validate_move(brd).sample
  update_board(brd, move, roster)
end

def strategic_move(brd, roster, strategy)
  WINNING_LINES.each do |line|
    possibles = []
    line.each { |sq| possibles << brd[sq] }

    if possibles.count(strategy) == 2
      possibles.each do |element|
        if element != PLAYER1_MARK && element != PLAYER2_MARK
          move = brd[element.to_i].to_i
          update_board(brd, move, roster)
          return true
        end
      end
    end
  end
  nil
end

def center_move(brd, roster)
  if brd[5] != PLAYER1_MARK && brd[5] != PLAYER2_MARK
    move = brd[5].to_i
    update_board(brd, move, roster)
    true
  end
end

def computer_move!(brd, roster)
  thinking(brd)

  case roster[:skill_level]
  when 'novice'
    random_move(brd, roster)
  when 'skilled'
    return if strategic_move(brd, roster, PLAYER2_MARK)
    return if strategic_move(brd, roster, PLAYER1_MARK)
    return if center_move(brd, roster)
    random_move(brd, roster)
  end
end

# game flow methods #

def make_move(brd, roster)
  if roster[:two_player]
    player_move!(brd, roster)
  elsif roster[:current_player] == roster[:player1]
    player_move!(brd, roster)
  else
    computer_move!(brd, roster)
  end
end

def update_match_score(stats, roster)
  if roster[:current_player][:mark] == 'X'
    stats[:player1_wins] += 1
  else
    stats[:player2_wins] += 1
  end
end

def update_stats(stats, roster)
  stats[:game_winner] = roster[:current_player][:name]
end

def detect_winner(brd, stats, roster)
  if WINNING_LINES.any? do |line|
    line.all? { |square| brd[square] == roster[:current_player][:mark] }
  end
    update_stats(stats, roster)
    update_match_score(stats, roster)
    return true
  end
  nil
end

def check_win?(brd, stats, roster)
  !!detect_winner(brd, stats, roster)
end

def game_over?(brd, stats, roster)
  display_board(brd)
  check_win?(brd, stats, roster) || check_draw(brd)
end

def change_current(roster)
  if roster[:current_player][:name] == roster[:player1][:name]
    roster[:current_player] = roster[:player2]
  else
    roster[:current_player] = roster[:player1]
  end
end

def check_draw(brd)
  validate_move(brd).empty?
end

def tournament_winner?(stats)
  stats[:player1_wins] == MATCH_WIN ||
    stats[:player2_wins] == MATCH_WIN ||
    stats[:draws] == MATCH_WIN
end

def display_tournament_winner(stats, roster)
  if stats[:player1_wins] == MATCH_WIN
    puts "#{roster[:player1][:name]} wins tournament" \
          " #{stats[:player1_wins]} - #{stats[:player2_wins]}."
  elsif stats[:player2_wins] == MATCH_WIN
    puts "#{roster[:player2][:name]} wins tournament" \
          " #{stats[:player2_wins]} - #{stats[:player1_wins]}."
  else
    puts "The match has ended in a draw!"
  end
end

def validate_yes(answer)
  if %w[y yes n no].include?(answer)
    true
  else
    prompt("??? Would you like to play again? Please enter (Y/n)? ")
  end
end

def play_again?
  valid_input = false
  prompt("Would you like to play again (Y/n)? ")
  until valid_input
    answer = gets.chomp.downcase
    valid_input = validate_yes(answer)
  end
  %w[y yes].include?(answer)
end

def validate_leave_game(answer)
  if ['', 'q', 'quit'].include?(answer)
    true
  else
    puts "??? Not sure what you wish to do."
    prompt("Press <enter> to continue or enter (q)uit to withdraw... ")
  end
end

def leave_game?
  valid_input = false
  prompt("Press <enter> to continue or enter (q)uit to withdraw... ")
  until valid_input
    answer = gets.chomp.downcase
    valid_input = validate_leave_game(answer)
  end
  answer != ''
end

roster = initialize_match
stats = initialize_stats
sayonara = false

system 'clear'
display_title("Welcome to #{GAME_TITLE}!")
puts INTRO['introduction']
roster[:player1][:name] = obtain_name('first')

if two_players?
  roster[:two_player] = true
  roster[:player2][:name] = obtain_name('second')
else
  roster[:skill_level] = obtain_skill_level
end

keep_score = tournament_or_single?

who_goes_first?(roster)

until sayonara
  board = initialize_board
  pause_play = true
  loop do
    display_board(board)
    make_move(board, roster)
    break if game_over?(board, stats, roster)
    change_current(roster)
  end

  display_board(board)

  if check_draw(board) && !stats[:game_winner]
    stats[:draws] += 1
    puts "It's a draw!"
  else
    puts "#{stats[:game_winner]} won!"
  end

  if keep_score
    puts "#{roster[:player1][:name]} wins: #{stats[:player1_wins]}" \
        " #{roster[:player2][:name]} wins: #{stats[:player2_wins]}" \
        " Draws: #{stats[:draws]}"
    stats[:game_winner] = nil
    if tournament_winner?(stats)
      display_tournament_winner(stats, roster)
    end
  end

  if !keep_score || tournament_winner?(stats)
    if play_again?
      pause_play = false
      stats = initialize_stats
      keep_score = tournament_or_single?
    else
      sayonara = true
    end
  end

  change_current(roster)

  sayonara = leave_game? if !sayonara && pause_play
end

puts "Thank you for playing #{GAME_TITLE} - Good bye."
