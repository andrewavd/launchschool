# oo_rpsls.rb
# November 28, 2018

require 'io/console'

VALUES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
TITLE = VALUES.join(' ')

module UxUi
  def prompt(message)
    print("\n => #{message}")
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def hr_ln
    puts '-' * (TITLE.length + 2)
  end

  def display_game_banner
    clear_screen
    hr_ln
    puts " #{TITLE}"
    hr_ln
  end

  def game_hold
    print "\nPress any key to continue..."
    STDIN.getch
    print " \r\n"
  end

  def display_player_greeting
    clear_screen
    display_game_banner
    puts "\nWelcome #{human.name}! Your opponent will be #{computer.name}."
    game_hold
  end

  def display_goodbye_message
    puts "\nGoodbye #{human.name}... Thank you for playing #{TITLE}!"
  end
end

# ---------------------------------------------------

class Move
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def >(other_move)
    win_matrix = {
      rock: ['scissors', 'lizard'],
      paper: ['rock', 'spock'],
      scissors: ['paper', 'lizard'],
      lizard: ['paper', 'spock'],
      spock: ['scissors', 'rock']
    }
    win_matrix[value.downcase.to_sym].include?(other_move.value.downcase.to_s)
  end

  def to_s
    @value
  end
end

# ---------------------------------------------------

class Player
  attr_accessor :name, :move, :score

  def initialize
    set_name
    @score = 0
  end
end

# ---------------------------------------------------

class Human < Player
  include UxUi

  def set_name
    player_name = ''
    esc_count = 0
    loop do
      prompt("Please enter your name: ")
      esc_count += 1
      player_name = gets.chomp.strip
      if esc_count == 3
        puts "It appears you wish to be the 'Invisible Man', so be it!"
        player_name = "Invisible Man"
        sleep 2
      end
      break unless player_name.empty? || player_name.squeeze == ' '
    end
    self.name = player_name
  end

  def obtain_player_input
    player_input = ''
    until %w[r rock p paper s scissors l lizard sp spock].include?(player_input)
      prompt("Please choose: (R)ock, (P)aper, (S)cissors, (L)izard, (Sp)ock? ")
      player_input = gets.chomp.downcase
    end
    player_input
  end

  def convert_player_input(player_input)
    player_input = 'k' if player_input == 'sp' || player_input == 'spock'
    throws = {
      r: 'Rock',
      p: 'Paper',
      s: 'Scissors',
      l: 'Lizard',
      k: 'Spock'
    }
    throws[player_input[0].to_sym]
  end

  def choose
    self.move = Move.new(convert_player_input(obtain_player_input))
  end
end

# ---------------------------------------------------

class Computer < Player
  def set_name
    self.name = ['R2-D2', 'C-3PO', 'K-2SO', 'BB-8', 'L3-37'].sample
  end

  def choose
    self.move = Move.new(VALUES.sample)
  end
end

# ---------------------------------------------------

class RPSGame
  include UxUi
  attr_accessor :human, :computer, :current_winner, :game_count

  WIN_GAME = 3

  def initialize
    display_game_banner
    @human = Human.new
    @computer = Computer.new
    display_player_greeting
    @current_winner = ''
    @game_count = 0
    @moves_count = {Rock: 0, Paper: 0, Scissors: 0, Lizard: 0, Spock: 0}
    @moves_history = []
  end

  def play_hand
    if human.move > computer.move
      self.current_winner = human.name
      human.score += 1
    elsif computer.move > human.move
      self.current_winner = computer.name
      computer.score += 1
    else
      self.current_winner = 'draw'
    end
  end

  def display_score
    clear_screen
    display_game_banner
    puts "--- Score Board ---".center(TITLE.size)
    puts "#{human.name} #{human.score} | #{computer.name} #{computer.score}".center(TITLE.size)
    puts "(First to #{WIN_GAME}, wins match)".center(TITLE.size)
    hr_ln
    # puts
  end

  def display_hand_winner
    if current_winner == 'draw'
      puts "This hand's a draw!".center(TITLE.size)
    else
      puts "#{current_winner.upcase} WINS!".center(TITLE.size)
    end
  end

  def display_moves
    puts "Game #{game_count}".center(TITLE.size)
    puts
    display_hand_winner
    puts
    puts "#{human.name}'s move: #{human.move}".center(TITLE.size)
    puts "vs".center(TITLE.size)
    puts "#{computer.name}'s move: #{computer.move}".gsub(/s's/, "s'").center(TITLE.size)
    hr_ln
  end

  def won_match?
    human.score == WIN_GAME || computer.score == WIN_GAME
  end

  def display_game_winner
    puts "\n  #{current_winner} won the game."
  end

  def reset_score
    human.score = 0
    computer.score = 0
    self.game_count = 0
  end

  def end_game?
    prompt("Would you like a rematch, (y)es or (n)o? ")
    answer = gets.chomp.downcase
    until %w[y yes n no].include?(answer)
      puts "??? - Please enter (y)es or (n)o."
    end
    answer == 'n' || answer == 'no'
  end

  def rpsls_throw
    human.choose
    computer.choose
    play_hand
  end

  def display_throw_results
    display_score
    display_moves
  end

  def play
    loop do
      loop do
        @game_count += 1
        rpsls_throw
        display_throw_results
        break if won_match?
      end
      display_game_winner
      break if end_game?
      reset_score
      display_game_banner
    end
    display_goodbye_message
  end
end

RPSGame.new.play
