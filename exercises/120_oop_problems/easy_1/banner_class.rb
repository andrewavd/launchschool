# banner_class.rb
# December 17, 2018

class Banner
  attr_reader :message, :width

  def initialize(message, width=0)
    @message = message
    set_width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def set_width(width)
    @width = width < message.size ? message.size : width
  end

  def horizontal_rule
    "+-" + "-" * (width) + "-+"
  end

  def empty_line
    "| #{" " * (width)} |"
  end

  def message_line
    "| " + message.center(width) + " |"
  end
end

def clear_screen
  system('clear') || system('cls')
end

clear_screen

banner = Banner.new('To boldly go where no one has gone before.', 80)
puts banner

banner = Banner.new('Merry Christmas from the Holmes family!', 60)
puts banner

banner = Banner.new('Andy Holmes', 80)
puts banner

# banner = Banner.new('')
# puts banner
