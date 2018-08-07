# Greeting a user

# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

# Further exploration
# Try modifying our solution to use String#chomp! and String#chop!, respectively.

def yell?(name)
  name.end_with?("!")
end

print "What's your name? "
name = gets.chomp!

if yell?(name)
  name = name.chop!
  puts "Hello #{name}. Why are we screaming".upcase
else
  puts "Hello #{name}."
end

