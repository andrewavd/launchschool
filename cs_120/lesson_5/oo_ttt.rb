# oo_ttt.rb
# November 30, 2018

DISPLAY_SIZE = 50

class Board
  BOARD_SIZE = 3
  BOARD_ROW = "-----+-----+-----"
  BOARDCOLUMN = "     |     |     "
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagnols
  def initialize
    @squares = {}
    reset
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    # returns winning marker or nil
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(key.to_s) }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts
    BOARD_SIZE.times do |x|
      puts BOARDCOLUMN.center(DISPLAY_SIZE)
      puts "  #{@squares[3 * x + 1]}  |  #{@squares[3 * x + 2]}  |"\
           "  #{@squares[3 * x + 3]}  ".center(DISPLAY_SIZE)
      puts BOARDCOLUMN.center(DISPLAY_SIZE)
      puts BOARD_ROW.center(DISPLAY_SIZE) if x != BOARD_SIZE - 1
    end
    puts
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker != 'X' && marker != 'O'
  end

  def marked?
    marker == 'X' || marker == 'O'
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  GAME_TITLE = "Tournament Tic Tac Toe"
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_PLAY = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = HUMAN_MARKER
  end

  def play
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        display_board
      end
      display_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  private

  def clear_screen
    system('clear') || system('cls')
  end

  def display_game_banner
    puts(('-' * GAME_TITLE.size).center(DISPLAY_SIZE))
    puts GAME_TITLE.center(DISPLAY_SIZE)
    puts(('-' * GAME_TITLE.size).center(DISPLAY_SIZE))
    puts
  end

  def display_board
    clear_screen
    display_game_banner
    puts "Human: #{human.marker} vs Computer: #{computer.marker}.".center(DISPLAY_SIZE)
    board.draw
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

  def human_moves
    print "Choose a square: (#{joinor(board.unmarked_keys)}): ".center(DISPLAY_SIZE)
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def thinking
    if board.unmarked_keys.size != 1
      puts "Computer thinking..."
      sleep 1
    end
  end
  
  def strategic_move(human, computer)
    Board::WINNING_LINES.each do |line|

      possibles = @squares.values_at(*line)
      p markers = possibles.select(&:marked?).collect(&:computer)
      if markers.count(computer) == 2
        binding.pry
        markers.each do |element|
          if element != human && element != computer
            board.set_square_at(element, computer)
            binding.pry
            return true
          end
        end
      end
    end
    nil
  end

  def computer_moves
    thinking

    return if board.strategic_move(human.marker, computer.marker)
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def human_turn?
    @current_player == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = COMPUTER_MARKER
    else
      computer_moves
      @current_player = HUMAN_MARKER
    end
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie."
    end
  end

  def play_again?
    answer = nil
    loop do
      print "Would you like to play again? (y/n) "
      answer = gets.chomp.downcase
      break if %w[y n].include? answer
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_player = FIRST_TO_PLAY
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye."
  end
end

game = TTTGame.new
game.play
