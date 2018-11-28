# oo_rpsls.rb
# November 28, 2018

VALUES = ['Rock', 'Paper', 'Scissors', 'Lizard', 'Spock']

module Prompt
  def prompt(message)
    print("=> #{message}")
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
    win_matrix[@value.downcase.to_sym].include?(other_move.value.downcase.to_s)
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
  include Prompt

  def set_name
    n = ''
    loop do
      prompt("Please enter your name: ")
      n = gets.chomp
      break unless n.empty? || n.squeeze == ' '
    end
    self.name = n
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
      l: 'Lizzard',
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
  include Prompt
  attr_accessor :human, :computer, :current_winner

  WIN_GAME = 3

  def initialize
    @computer = Computer.new
    @current_winner = ''
  end

  def display_welcome_message
    puts "Rock, Paper, Scissors"
  end

  def display_player_greeting
    puts "Welcome #{self.human.name} --- Your opponent will be #{computer.name}."
  end

  def display_goodbye_message
    puts "Goodbye #{human.name}... Thank you for playing Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name}'s move: #{human.move} vs #{computer.name}'s move: " \
    "#{computer.move}".gsub(/s's/, "s'")
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

  def display_hand_winner
    if current_winner == 'draw'
      puts "This hand's a draw!"
    else
      puts "#{current_winner} wins!"
    end
  end

  def display_score
    puts "--- Score Board ---"
    puts "#{human.name} #{human.score} | #{computer.name} #{computer.score}"
  end

  def won_match?
    human.score == WIN_GAME || computer.score == WIN_GAME
  end

  def display_game_winner
    puts "#{current_winner} won the game."
  end

  def reset_score
    human.score = 0
    computer.score = 0
    current_winner = ''
  end

  def end_game?
    prompt("Would you like a rematch, (y)es or (n)o? ")
    answer = gets.chomp.downcase
    until %w[y yes n no].include?(answer)
      puts "??? - Please enter (y)es or (n)o."
    end
    answer == 'n' || answer == 'no'
  end

  def play
    display_welcome_message
    @human = Human.new
    display_player_greeting
    loop do
      loop do
        human.choose
        computer.choose
        play_hand
        display_moves
        display_hand_winner
        display_score
        break if won_match?
      end
      display_game_winner
      break if end_game?
      reset_score
    end
    display_goodbye_message
  end
end

RPSGame.new.play
