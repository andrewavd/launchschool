# oo_rpsls.rb
# November 28, 2018

require 'io/console'

module UxUi
  def prompt(message)
    print("\n => #{message}")
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def hr_ln
    puts '-' * RPSLSGame::DISPLAY_SIZE
  end

  def display_game_banner
    clear_screen
    hr_ln
    puts " #{RPSLSGame::TITLE}".center(RPSLSGame::DISPLAY_SIZE)
    hr_ln
  end

  def game_hold
    print "\nPress any key to continue..."
    STDIN.getch
    print " \n"
  end

  def display_game_notes
    puts "\n  Game Notes:"
    puts "    - The history of each player's moves is displayed after each"\
         " 'throw',"
    puts "      \"h\" may be entered at the 'Please choose:' your move prompt"\
         " to toggle"
    puts "      the history on/off."
    puts
    game_hold
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
      Rock: ['Scissors', 'Lizard'],
      Paper: ['Rock', 'Spock'],
      Scissors: ['Paper', 'Lizard'],
      Lizard: ['Paper', 'Spock'],
      Spock: ['Scissors', 'Rock']
    }
    win_matrix[value.to_sym].include?(other_move.value.to_s)
  end

  def to_s
    @value
  end
end

# ---------------------------------------------------

class Player
  attr_accessor :name, :move, :score, :moves_history

  R_P_S_SP_L_ORDERED = ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard']
  STUBBORN_THROW = R_P_S_SP_L_ORDERED.sample
  OLD_SCHOOL = ['Rock', 'Paper', 'Scissors']

  def initialize
    set_name
    @moves_history = []
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
      display_game_banner
      prompt("Please enter your name: ")
      player_name = gets.chomp.strip
      esc_count += 1
      if esc_count == 4
        puts "It appears you wish to be the 'Invisible Man', so be it!"
        player_name = "Invisible Man"
        sleep 2
      end
      break unless player_name.empty? || player_name.squeeze == ' '
    end
    self.name = player_name
  end

  def choose
    self.move = Move.new(convert_player_input(obtain_player_input))
    moves_history << move.value
  end

  private

  def default_player_choice
    puts "    It appears you're struggling with choosing a throw..."
    puts "    I'll make a choice for you."
    player_input = RPSLSGame::THROW_VALUES.sample.downcase
    puts "\n    Your throw will be: #{player_input}"
    sleep 2
    player_input
  end

  def toggle_history
    RPSLSGame.toggle_history_visible
    puts "\n'History of Moves' has been turned"\
          " #{RPSLSGame.history_visible? ? 'on' : 'off'}."
  end

  def validate_throw(player_input)
    esc_count = 0
    until %w[r rock p paper s scissors l lizard sp spock].include?(player_input)
      if player_input == 'h' || player_input == 'history'
        toggle_history
        player_input = obtain_player_throw
      else
        esc_count += 1
        puts "I'm sorry, \"#{player_input}\" is an"\
             " invlaid choice. Let's try again..."
        player_input = obtain_player_throw
        player_input = default_player_choice if esc_count == 3
      end
    end
    player_input
  end

  def obtain_player_throw
    prompt("Please choose: (R)ock, (P)aper, (S)cissors, (L)izard, (Sp)ock? ")
    gets.chomp.downcase
  end

  def obtain_player_input
    player_input = obtain_player_throw
    validate_throw(player_input)
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
end

# ---------------------------------------------------

class Bb8 < Player
  def set_name
    self.name = 'bb8'
  end

  def choose
    self.move = Move.new(rotate_defense)
    moves_history << move.value
  end

  def initial_greeting
    "\n(translated...) \"Hey, I'm BB-8, just rolling along!\""
  end

  def rotate_defense
    index = (moves_history.size + 1) % 4
    R_P_S_SP_L_ORDERED[index]
  end
end

# ---------------------------------------------------

class R2d2 < Player
  def set_name
    self.name = 'R2-D2'
  end

  def choose
    self.move = Move.new(rotate_values)
    moves_history << move.value
  end

  def initial_greeting
    "\n(translated...) \"Nice to meet you, I'm"\
    " R2-D2, you can call me R2 for short.\""
  end

  def rotate_values
    index = moves_history.size % 5
    RPSLSGame::THROW_VALUES[index]
  end
end

# ---------------------------------------------------

class L337 < Player
  def set_name
    self.name = 'L3-37'
  end

  def choose
    self.move = Move.new(RPSLSGame::THROW_VALUES.sample)
    moves_history << move.value
  end

  def initial_greeting
    "\nI'm L3_37. I'm a self made droid!"
  end
end

# ---------------------------------------------------

class C3po < Player
  def set_name
    self.name = 'C-3PO'
  end

  def choose
    self.move = Move.new(OLD_SCHOOL.sample)
    moves_history << move.value
  end

  def initial_greeting
    "\nHi, I'm C-3PO, human cyborg relations."
  end
end

# ---------------------------------------------------

class K2so < Player
  def initialize
    super
    load_strategy_profile
  end

  def set_name
    self.name = 'K-2SO'
  end

  def choose
    self.move = Move.new(STUBBORN_THROW)
    moves_history << move.value
  end

  def initial_greeting
    "\nHello, I'm K-2SO, a reprogrammed imperial droid."
  end

  def load_strategy_profile
    RPSLSGame.toggle_history_visible
  end
end

# ---------------------------------------------------

class RPSLSGame
  include UxUi
  attr_accessor :human, :droid, :current_winner, :game_count

  DISPLAY_SIZE = 50
  THROW_VALUES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
  TITLE = THROW_VALUES.join(' ')
  WIN_GAME = 5

  @history_visible = true

  def initialize
    @human = Human.new
    set_droid
    display_player_greeting
    @game_count = 0
  end

  def self.history_visible?
    @history_visible
  end

  def self.toggle_history_visible
    @history_visible = !@history_visible
  end

  def play
    loop do
      loop do
        rpsls_throw
        display_throw_results
        break if match_won?
      end
      display_game_winner
      break if end_game?
      reset_score
      display_game_banner
      display_rematch_greeting
    end
    display_goodbye_message
  end

  private

  def set_droid
    @droid = ['C-3PO', 'K-2SO', 'R2-D2', 'BB-8', 'L3-37'].sample.new
  end

  # -- "display" methods --

  def display_player_greeting
    clear_screen
    display_game_banner
    puts "\nWelcome #{human.name}! Your opponent will be #{droid.name}."
    droid.initial_greeting
    game_hold
    display_game_notes
  end

  def display_score
    display_game_banner
    puts "--- Score Board ---".center(DISPLAY_SIZE)
    puts "#{human.name} #{human.score} | #{droid.name}"\
         " #{droid.score}".center(DISPLAY_SIZE)
    puts "(First to #{WIN_GAME}, wins match)".center(DISPLAY_SIZE)
    hr_ln
  end

  def display_game_number
    puts "Game #{game_count}".center(DISPLAY_SIZE)
    puts
  end

  def display_hand_winner
    if current_winner == ''
      puts "This hand's a draw!".center(DISPLAY_SIZE)
    else
      puts "#{current_winner.upcase} WINS!".center(DISPLAY_SIZE)
    end
    puts
  end

  def display_moves
    puts "#{human.name}'s move: #{human.move}"
      .sub(/s's/, "s'").center(DISPLAY_SIZE)
    puts "vs".center(DISPLAY_SIZE)
    puts "#{droid.name}'s move: #{droid.move}"
      .sub(/s's/, "s'").center(DISPLAY_SIZE)
    hr_ln
  end

  def display_game_winner
    puts "\n  #{current_winner} won the game."
  end

  def display_history_headings
    puts "History of Moves".center(DISPLAY_SIZE)
    print human.name.center(DISPLAY_SIZE / 2)
    puts droid.name.center(DISPLAY_SIZE / 2)
  end

  def display_history
    display_history_headings
    (0..human.moves_history.size - 1).each do |index|
      print "     #{index + 1}. #{human.moves_history[index]}".ljust(30)
      puts "#{index + 1}. #{droid.moves_history[index]}".ljust(25)
    end
  end

  def display_rematch_greeting
    clear_screen
    display_game_banner
    print "\n#{droid.name}, are you ready for the rematch? "
    sleep 1
    puts "Yes"
    puts "\n#{human.name}, When you are ready... "
    game_hold
  end

  def display_goodbye_message
    puts "\nGoodbye #{human.name}... Thank you for playing #{RPSLSGame::TITLE}!"
  end

  def display_throw_results
    display_score
    display_game_number
    display_hand_winner
    display_moves
    display_history if RPSLSGame.history_visible?
  end

  # -- end display methods --

  def reset_score
    human.score = 0
    droid.score = 0
    self.game_count = 0
  end

  def end_game?
    prompt("Would you like a rematch? (Y)es to continue,"\
           " or any other key to exit. ")
    STDIN.getch.downcase != 'y'
  end

  def match_won?
    human.score == WIN_GAME || droid.score == WIN_GAME
  end

  def update_score(winner)
    if winner == human.name
      human.score += 1
    elsif winner == droid.name
      droid.score += 1
    end
  end

  def play_hand
    self.current_winner = if human.move > droid.move
                            human.name
                          elsif droid.move > human.move
                            self.current_winner = droid.name
                          else
                            self.current_winner = ''
                          end
  end

  def rpsls_throw
    self.game_count += 1
    human.choose
    droid.choose
    play_hand
    update_score(current_winner)
  end
end

friendly = RPSLSGame.new
friendly.play
