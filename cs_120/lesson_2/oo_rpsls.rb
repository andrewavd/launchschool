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
  attr_accessor :name, :move, :score, :moves_history, :history_toggle

  def initialize
    set_name
    @moves_history = []
    @history_toggle = true
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
      esc_count += 1
      player_name = gets.chomp.strip
      if esc_count == 4
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
      if player_input == 'h' || player_input == 'history'
        self.history_toggle = !history_toggle
        puts "\n'History of Moves' has been turned"\
             " #{history_toggle ? 'on' : 'off'}."
      end
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
    moves_history << move.value
  end
end

# ---------------------------------------------------

class Computer < Player
  attr_accessor :initial_greeting
  attr_reader :stubborn_throw

  def initialize
    super
    load_droid_profile
    @stubborn_throw = RPSLSGame::VALUES.sample
  end

  def set_name
    self.name = 'BB-8'#['C-3PO', 'K-2SO','R2-D2', 'BB-8', 'L3-37'].sample
  end

  def load_droid_profile
    case name
    when 'C-3PO'
      self.initial_greeting = "\nHi, I'm C-3PO, human cyborg relations."
    when 'K-2SO'
      self.initial_greeting = "\nGreetings, I'm K-2SO, a reprogrammed imperial droid."
    when 'L3-37'
      self.initial_greeting = "\nI'm L3_37. I'm a self made droid!"
    when 'R2-D2'
      self.initial_greeting = "\n(translated...) \"Nice to meet you, I'm R2-D2,"\
                              " you can call me R2 for short.\""
    when 'BB-8'
      self.initial_greeting = "\n(translated...) \"Hey, I'm BB-8.\""
    end
  end

  def rotate_values
    x = moves_history.size % 5
    RPSLSGame::VALUES[x]
  end

  def rotate_defense
    y = (moves_history.size + 1) % 4
    ['Rock', 'Paper', 'Scissors', 'Spock', 'Lizard'][y]
  end

  def old_school
    original_throws = ['Rock', 'Paper', 'Scissors'].sample
  end

  def stuck_on_it
    stubborn_throw
  end

  def random_choices
    RPSLSGame::VALUES.sample
  end

  def choose
    case name
    when 'C-3PO'
      self.move = Move.new(old_school)
    when 'K-2SO'
      self.move = Move.new(stuck_on_it)
    when 'L3-37'
      self.move = Move.new(random_choices)
    when 'R2-D2'
      self.move = Move.new(rotate_values)
    when 'BB-8'
      self.move = Move.new(rotate_defense)
    end
    moves_history << move.value
  end
end

# ---------------------------------------------------

class RPSLSGame
  include UxUi
  attr_accessor :human, :computer, :current_winner, :game_count

  DISPLAY_SIZE = 50
  VALUES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']
  TITLE = VALUES.join(' ')
  WIN_GAME = 5

  def initialize
    @human = Human.new
    @computer = Computer.new
    display_player_greeting
    @game_count = 0
  end

  def play_hand
    self.current_winner = if human.move > computer.move
                            human.name
                          elsif computer.move > human.move
                            self.current_winner = computer.name
                          else
                            self.current_winner = ''
                          end
  end

  def update_score(winner)
    if winner == human.name
      human.score += 1
    elsif winner == computer.name
      computer.score += 1
    end
  end

  def display_score
    display_game_banner
    puts "--- Score Board ---".center(DISPLAY_SIZE)
    puts "#{human.name} #{human.score} | #{computer.name}"\
         " #{computer.score}".center(DISPLAY_SIZE)
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
    puts "#{computer.name}'s move: #{computer.move}"
      .sub(/s's/, "s'").center(DISPLAY_SIZE)
    hr_ln
  end

  def display_game_winner
    puts "\n  #{current_winner} won the game."
  end

  def end_game?
    prompt("Would you like a rematch? (Y)es to continue,"\
           " or any other key to exit. ")
    STDIN.getch.downcase != 'y'
  end

  def reset_score
    human.score = 0
    computer.score = 0
    self.game_count = 0
  end

  def rpsls_throw
    self.game_count += 1
    human.choose
    computer.choose
    play_hand
    update_score(current_winner)
  end

  def display_history_headings
    puts "History of Moves".center(DISPLAY_SIZE)
    print human.name.center(DISPLAY_SIZE / 2)
    puts computer.name.center(DISPLAY_SIZE / 2)
  end

  def display_history
    display_history_headings
    (0..human.moves_history.size - 1).each do |index|
      print "     #{index + 1}. #{human.moves_history[index]}".ljust(30)
      puts "#{index + 1}. #{computer.moves_history[index]}".ljust(25)
    end
  end

  def display_throw_results
    display_score
    display_game_number
    display_hand_winner
    display_moves
    display_history if human.history_toggle
  end

  def match_won?
    human.score == WIN_GAME || computer.score == WIN_GAME
  end

  def display_player_greeting
    clear_screen
    display_game_banner
    puts "\nWelcome #{human.name}! Your opponent will be #{computer.name}."
    puts "#{computer.initial_greeting}"
    game_hold
  end

  def display_rematch_greeting
    clear_screen
    display_game_banner
    print "\n#{computer.name}, are you ready for the rematch? "
    sleep 1
    puts "Yes"
    puts "\n#{human.name}, When you are ready... "
    game_hold
  end

  def display_goodbye_message
    puts "\nGoodbye #{human.name}... Thank you for playing #{RPSLSGame::TITLE}!"
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
end

friendly = RPSLSGame.new
friendly.play
