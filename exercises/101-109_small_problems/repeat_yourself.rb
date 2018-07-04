# repeat_yourself.rb

# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

def repeat_string(str, int)
  int.times do
    puts(str)
  end
end

repeat_string('Andy Holmes', 5)
