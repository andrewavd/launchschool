# Tic Tac Toe
require 'pry'
require 'yaml'

INTRO = YAML.load_file('tournament_ttt_intro.yml')
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
MATCH_WIN = 2
GAME_TITLE = 'Tournament Tic Tac Toe'

def initialize_match
  {
    player1: { name: '', mark: PLAYER_MARK },
    player2: { name: 'Computer', mark: COMPUTER_MARK },
    two_player: false,
    current_player: '',
    player1_wins: 0,
    player2_wins: 0,
    draws: 0,
    skill_level: ''
  }
end

def title_underscore(repetitions)
  repetitions.times { print"-" }
  puts ""
end

def display_title(title)
  puts ""
  puts title.to_s
  title_underscore(title.length)
  puts ""
end

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

def prompt(message)
  puts ""
  print "=> #{message}"
end

def display_board(brd)
  system 'clear'
  display_title('Tournament Tic Tac Toe')
  puts "        |     |"
  puts "     #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "     #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "        |     |"
  puts "   -----+-----+-----"
  puts "        |     |"
  puts "     #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "        |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = num.to_s }
  new_board
end

def validate_move(brd)
  brd.keys.select { |num| brd[num] != PLAYER_MARK && brd[num] != COMPUTER_MARK }
end

def update_board(brd, move, stats)
  if stats[:current_player] == stats[:player1][:name]
    brd[move] = stats[:player1][:mark]
  else
    brd[move] = stats[:player2][:mark]
  end
end

def joinor(arr, seperator = ', ', conjunction = "or")
  new_str = ''
  case arr.size
  when 1
    new_str << arr[0].to_s
  when 2
    new_str << arr[0].to_s + " " + conjunction + " " + arr[1].to_s
  else
    arr.each_with_index do |elem, index|
      if arr.size - 1 == index
        new_str << conjunction + " " + elem.to_s
      else
        new_str << elem.to_s + seperator
      end
    end
  end
  new_str
end

def player_move!(brd, stats)
  move = validate_move(brd)[0]
  if validate_move(brd).size == 1
    valid_move = true
    puts "Square #{move} is the last move available..."
    puts "I'll fill it in for you."
    sleep 2
  else
    valid_move = false
  end
  until valid_move
    prompt("#{stats[:current_player]} choose a square" \
            " (#{joinor(validate_move(brd))}): ")
    move = gets.chomp.to_i
    if validate_move(brd).include?(move)
      valid_move = true
    else
      puts("That square is unavailable.")
    end
  end
  update_board(brd, move, stats)
end

def thinking
  puts "Computer thinking..."
  sleep 1
end

def computer_move!(brd, stats)
  thinking

  case stats[:skill_level]
  when 'novice'
    move = validate_move(brd).sample
    update_board(brd, move, stats)
  when 'skilled'
    winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                    [[1, 5, 9], [3, 5, 7]]

    move = 0

    winning_lines.each do |line|
      offense = []
      line.each do |sq|
        offense << brd[sq]
      end
      if offense.count(COMPUTER_MARK) == 2
        offense.each do |element|
          if element != PLAYER_MARK && element != COMPUTER_MARK
            move = brd[element.to_i].to_i
            return update_board(brd, move, stats)
          end
        end
      end
    end

    winning_lines.each do |line|
      defense = []
      line.each do |sq|
        defense << brd[sq]
      end
      if defense.count(PLAYER_MARK) == 2
        defense.each do |element|
          if element != PLAYER_MARK && element != COMPUTER_MARK
            move = brd[element.to_i].to_i
            return update_board(brd, move, stats)
          end
        end
      end
    end

    if brd[5] != PLAYER_MARK && brd[5] != COMPUTER_MARK
      move = brd[5].to_i
      return update_board(brd, move, stats)
    end

    move = validate_move(brd).sample
    update_board(brd, move, stats)
  end
end

def make_move(brd, stats)
  if stats[:two_player]
    player_move!(brd, stats)
    if stats[:current_player] == stats[:player1][:name]
      stats[:current_player] = stats[:player2][:name]
    else
      stats[:current_player] = stats[:player1][:name]
    end
  elsif stats[:current_player] == stats[:player1][:name]
    player_move!(brd, stats)
    stats[:current_player] = stats[:player2][:name]
  else
    computer_move!(brd, stats)
    stats[:current_player] = stats[:player1][:name]
  end
end

def update_match(mark, stats)
  if mark == 'X'
    stats[:player1_wins] += 1
  elsif mark == 'O'
    stats[:player2_wins] += 1
  else
    stats[:draws] += 1
  end
end

def check_draw(brd)
  validate_move(brd).empty?
end

def detect_winner(brd, stats)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARK &&
       brd[line[1]] == PLAYER_MARK &&
       brd[line[2]] == PLAYER_MARK
      return stats[:player1][:name]
    elsif brd[line[0]] == COMPUTER_MARK &&
          brd[line[1]] == COMPUTER_MARK &&
          brd[line[2]] == COMPUTER_MARK
      return stats[:player2][:name]
    end
  end
  nil
end

def tournament_winner?(stats)
  stats[:player1_wins] == MATCH_WIN ||
    stats[:player2_wins] == MATCH_WIN ||
    stats[:draws] == MATCH_WIN
end

def display_tournament_winner(stats)
  if stats[:player1_wins] == MATCH_WIN
    puts "#{stats[:player1][:name]} wins tournament" \
          " #{stats[:player1_wins]} - #{stats[:player2_wins]}."
  elsif stats[:player2_wins] == MATCH_WIN
    puts "#{stats[:player2][:name]} wins tournament" \
          " #{stats[:player2_wins]} - #{stats[:player1_wins]}."
  else
    puts "The match has ended in a draw!"
  end
end

def check_win?(brd, stats)
  !!detect_winner(brd, stats)
end

def game_over?(brd, stats)
  check_win?(brd, stats) || check_draw(brd)
end

def play_again?
  prompt "Would you like to play again (Y/n)? "
  answer = gets.chomp
  answer == "yes" ? true : false
end

def validate_first_player(stats)
  if stats[:current_player] == stats[:player1][:name] || stats[:current_player] == stats[:player2][:name]
    true
  else
    prompt("#{stats[:current_player]} ??? I'm not sure who that is. Please choose #{stats[:player1][:name]} or #{stats[:player2][:name]}: ")
  end
end

def validate_game_format(game_format)
  if %w(t tournament s single).include?(game_format)
    true
  else
    prompt("??? Please choose tournament or single: ")
  end
end

def who_goes_first?(stats)
  valid_input = false
  prompt("Choose who goes first: (#{stats[:player1][:name]} or #{stats[:player2][:name]}) ")
  until valid_input
    stats[:current_player] = gets.chomp.capitalize
    valid_input = validate_first_player(stats)
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

stats = initialize_match
sayonara = false

system 'clear'
display_title("Welcome to #{GAME_TITLE}!")
puts (INTRO['introduction'])
stats[:player1][:name] = obtain_name('first')

prompt("(1)ne or (2)wo players? ")
num_of_players = gets.chomp
if num_of_players == '2'
  stats[:two_player] = true
  stats[:player2][:name] = obtain_name('second')
else
  prompt("What skill level do you want the Computer" \
          " to play at (novice, skilled or expert)? ")
  stats[:skill_level] = gets.chomp
end

keep_score = tournament_or_single?

who_goes_first?(stats)

until sayonara
  board = initialize_board

  until game_over?(board, stats)
    display_board(board)
    make_move(board, stats)
    break if game_over?(board, stats)
  end

  display_board(board)

  if check_win?(board, stats)
    if detect_winner(board, stats) == stats[:player1][:name]
      puts "#{detect_winner(board, stats)} won!"
      update_match(PLAYER_MARK, stats)
    else
      puts "#{detect_winner(board, stats)} won!"
      update_match(COMPUTER_MARK, stats)
    end
  else
    update_match('D', stats)
    puts "It's a draw!"
  end

  puts "#{stats[:player1][:name]} wins: #{stats[:player1_wins]}" \
        " #{stats[:player2][:name]} wins: #{stats[:player2_wins]}" \
        " Draws: #{stats[:draws]}"

  if keep_score
    if tournament_winner?(stats)
      display_tournament_winner(stats)
      if play_again? != "yes"
        keep_score = false
        sayonara = true
      end
    end
    puts
    puts "Press <enter> to continue..."
    puts "or (q)uit to withdraw..."
    answer = gets.chomp
    if answer == "q"
      sayonara = true
    end
  else
    if !play_again?
      sayonara = true
    else
      keep_score = tournament_or_single?
    end
  end

end

puts "Thank you for playing #{GAME_TITLE} - Good bye."
