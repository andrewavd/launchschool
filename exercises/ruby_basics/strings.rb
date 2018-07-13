# Create a String
# Create an empty string using the String class and assign it to a variable.

my_string = String.new
# or
new_string = ''

# Quote Confusion
# Modify the following code so that double-quotes are used instead of single-quotes.

puts
puts "'Quote Confusion'"
puts "---------------"
puts

puts 'It\'s now 12 o\'clock.'
puts "It's now 12 o'clock."

# Ignoring Case
# Using the following code, compare the value of name with the string 'RoGeR' while ignoring
# the case of both strings. Print true if the values are the same; print false if they aren't.
# Then, perform the same case-insensitive comparison, except compare the value of name with the
# string 'DAVE' instead of 'RoGeR'.

puts
puts "'Ignoring Case'"
puts "---------------"
puts

name = 'Roger'

puts name.downcase == 'RoGeR'.downcase
puts name.downcase == 'DAVE'.downcase

# Better way

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0

# Dynamic String
# Modify the following code so that the value of name is printed within "Hello, !".
puts
puts "'Dynamic String'"
puts "---------------"
puts

name = 'Andy'

puts "Hello, #{name}!"

# Combining Names
# Using the following code, combine the two names together to form a full name and assign that
# value to a variable named full_name. Then, print the value of full_name.

puts
puts "'Combining Names'"
puts "---------------"
puts

first_name = 'Andy'
last_name = 'Holmes'

full_name = first_name + ' ' + last_name
puts full_name

# Tricky Formatting
# Using the following code, capitalize the value of state then print the modified value. Note
# that state should have the modified value both before and after you print it.
puts
puts "'Tricky Formatting'"
puts "---------------"
puts
state = 'mAiNe'
puts state.capitalize!
puts state

# Goodbye, nor Hello
# Given the following code, invoke a destructive method on greeting so that Goodbye! is printed
# instead of Hello!.
puts
puts "'Goodbye, not Hello'"
puts "---------------"
puts

greeting = 'Hello!'
greeting.gsub!('H', 'J')
puts greeting
greeting.gsub!('Jello', 'Goodbye')
puts greeting

# Print the Alphabet
# Using the following code, split the value of alphabet by individual characters and print each character.

puts
puts "'Print the Alphabet'"
puts "---------------"
puts

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.chars
#puts alphabet.split('')
#puts alphabet.each_char {|letter| puts "#{letter}"}

# Pluralize
# Given the following code, use Array#each to print the plural of each word in words.
puts
puts "'Pluralize'"
puts "---------------"
puts

words = 'car human elephant airplane'

words.split(' ').each {|x| puts("#{x}" + "s") }
# OR
puts words.split(' ').each {|x| x << "s"}

# Are You There?
# Using the following code, print true if colors includes the color 'yellow' and print false
# if it doesn't. Then, print true if colots includes the color 'purple' and print false if it doesn't.
puts
puts "'Are You There?'"
puts "---------------"
puts

colors = 'blue pink yellow orange'

puts colors.include?('yellow')
puts colors.include?('purple')