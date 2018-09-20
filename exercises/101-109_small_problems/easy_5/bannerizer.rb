# bannerizer.rb
# Write a method that will take a short line of text and print it within a box.

def print_box()
  puts
end

def print_in_box(str)
  if str.size > 76
    str = str[0..72] + '...'
  end
  puts("+-#{'-' * str.length}-+")
  puts("| #{' ' * str.length} |")
  puts("| #{str} |")
  puts("| #{' ' * str.length} |")
  puts("+-#{'-' * str.length}-+")
end

print_in_box('To boldly go where no one has gone before.')
print_in_box("Space... The final frontier. These are the voyages of the starship Enterprise, it's five year mission To boldly go where no one has gone before.")
print_in_box('')