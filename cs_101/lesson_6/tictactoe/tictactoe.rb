# Tic Tac Toe
require 'pry'

PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
MATCH_WIN = 2

def initialize_match
  {
    player1_name: '',
    player_wins: 0,
    computer_wins: 0,
    draws: 0
  }
end

def prompt(message)
  print "=> #{message}"
end

def display_board(brd)
  system 'clear'
  puts "Tournament Tic Tac Toe"
  puts "----------------------"
  puts ""
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
  (1..9).each { |num| new_board[num] = "#{num}" }
  new_board
end

def validate_move(brd)
  brd.keys.select { |num| brd[num] != PLAYER_MARK && brd[num] != COMPUTER_MARK }
end

def update_board(brd, move, mark)
  brd[move] = mark
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
    sleep 3
  else
    valid_move = false
  end
  until valid_move
    prompt("#{stats[:player1_name]} choose a square (#{joinor(validate_move(brd))}): ")
    move = gets.chomp.to_i
    if validate_move(brd).include?(move)
      valid_move = true
    else
      puts("That square is unavailable.")
    end
  end
  update_board(brd, move, PLAYER_MARK)
end

def thinking()
  puts "Computer thinking..."
  sleep 1
end

=begin
def arbitrary_move(brd)
  thinking()
  validate_move(brd).sample
end

def play_middle_square(brd)
  thinking()
  if brd[5] != PLAYER_MARK && brd[5] != COMPUTER_MARK
    move = brd[5].to_i
    return update_board(brd, move, COMPUTER_MARK)
  end
end

def ai_move(brd)
  players = [COMPUTER_MARK, PLAYER_MARK]

  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
  [[1, 5, 9], [3, 5, 7]]

  move = 0

  players.each do |mark|
    winning_lines.each do |line|
      offense = []
      line.each do |sq|
        offense << brd[sq]
      end
      if offense.count(mark) == 2
        offense.each do |element|
          if element != PLAYER_MARK && element != COMPUTER_MARK
            move = brd[element.to_i].to_i
            thinking()
            return update_board(brd, move, mark)
          end
        end
      end
    end
  end

  #return update_board(brd, brd[5], COMPUTER_MARK) if play_middle_square(brd)
  #update_board(brd, arbitrary_move(brd), COMPUTER_MARK)
end
=end

def computer_move!(brd)
  # ai_move(brd)
  #return if update_board(brd, brd[5], COMPUTER_MARK) if play_middle_square(brd)
  #update_board(brd, arbitrary_move(brd), COMPUTER_MARK)

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
          thinking()
          return update_board(brd, move, COMPUTER_MARK)
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
          thinking()
          return update_board(brd, move, COMPUTER_MARK)
        end
      end
    end
  end


  if brd[5] != PLAYER_MARK && brd[5] != COMPUTER_MARK
    move = brd[5].to_i
    return update_board(brd, move, COMPUTER_MARK)
  end

  move = validate_move(brd).sample
  thinking()
  update_board(brd, move, COMPUTER_MARK)
end

def update_match(mark, stats)
  if mark == 'X'
    stats[:player_wins] += 1
  elsif mark == 'O'
    stats[:computer_wins] += 1
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
       return stats[:player1_name]
    elsif brd[line[0]] == COMPUTER_MARK &&
      brd[line[1]] == COMPUTER_MARK &&
      brd[line[2]] == COMPUTER_MARK
      return 'Computer'
    end
  end
  nil
end

def tournament_winner?(stats)
  stats[:player_wins] == MATCH_WIN || stats[:computer_wins] == MATCH_WIN || stats[:draws] == MATCH_WIN
end

def display_tournament_winner(stats)
  if stats[:player_wins] == MATCH_WIN
    puts "#{stats[:player1_name]} wins tournament #{stats[:player_wins]} - #{stats[:computer_wins]}."
  elsif stats[:computer_wins] == MATCH_WIN
    puts "Computer wins tournament #{stats[:computer_wins]} - #{stats[:player_wins]}."
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

def play_again?()
  prompt "Would you like to play again (Y/n)? "
  answer = gets.chomp
  answer == "yes" ? true : false
end

def tournament_or_single?()
  prompt("Choose (T)ournament or (S)ingle: ")
  game_style = gets.chomp
  game_style == "t" ? true : false
end

stats = initialize_match()
sayonara = false

puts
puts "Welcome to Tournament Tic Tac Toe!"

puts
puts "Tournament Tic Tac Toe can be played as a single game or tournament."
puts "Tournament style - First player to win 5 games wins the tournament."
puts "Single Game - No score is kept."

prompt("Please enter your first name: ")
stats[:player1_name] = gets.chomp
keep_score = tournament_or_single?()
puts "keep_score = #{keep_score}"
sleep 2

=begin
prompt("(O)ne or (t)wo players? ")
num_of_players = gets.chomp
if num_of_players == 2
  prompt("Enter second player first name: ")
  second_name = gets.chomp
end

prompt("Choose who goes first : ")
goes_first = gets.chomp
=end

until sayonara
  board = initialize_board

  until game_over?(board, stats)
    display_board(board)
    player_move!(board, stats)
    break if game_over?(board, stats)
    display_board(board)
    computer_move!(board)
    display_board(board)
  end

  display_board(board)

  if check_win?(board, stats)
    if detect_winner(board, stats) == stats[:player1_name]
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

  puts "Player wins: #{stats[:player_wins]} Computer wins: #{stats[:computer_wins]} Draws: #{stats[:draws]}"

  if keep_score
    if tournament_winner?(stats)
      display_tournament_winner(stats)
      play_again?()
      if answer != "yes"
        keep_score = false
        sayonara = true
      end
    end
  else
    if !play_again?()
      sayonara = true
    else
      keep_score = tournament_or_single?()
    end   
  end


end

puts "Thank you for playing - Good bye."
