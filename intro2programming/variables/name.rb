# (Exercise #1) Write a program called name.rb that asks the user to type in their
# name and then prints out a greeting message with their name included.

# (Exercise #3) Add another section onto name.rb that prints the name of the user 10 times.
# You must do this without explicitly writing the puts method 10 times in a row.
# Hint: you can use the times method to do something repeatedly.

# (Exercise #4) Modify name.rb again so that it first asks the user for their first name,
# saves it into a variable, and then does the same for the last name.
# Then outputs their full name all at once.

print "Hi, what's your first name? "
first_name = gets.chomp
print "What's your last name? "
last_name = gets.chomp
10.times do 
  puts "Hi #{first_name} #{last_name}, nice to meet you!"
end