# Even or Odd?
# Write a loop that prints numbers 1-5 and whether the number is even or odd.
# Use the code below to get started.
puts
puts "'Even or Odd?'"
puts "------------"
puts
count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end
  break if count == 5
  count += 1
end


# Catch the Number
# Modify the following code so that the loop stops if number is between 0 and 10.
puts
puts "'Catch the Number'"
puts "------------"
puts
loop do
  number = rand(100)
  #break if number >= 0 && number <= 10 # My way
  break if number.between?(0, 10) # Solution provided
  puts number # I chose not to print the number that breaks the loop.
end

# Conditional loop
# Using the if/else statement, run a loop that prints "The loop was processed!" one time
# if process_the_loop equals true.
# Print "The loop wasn't processed!" if process_the_loop equals false.
puts
puts "'Conditional Loop'"
puts "------------"
puts
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break # I didn' understand the instructions and omitted the loop.
  end
else
  puts "The loop wasn't processed!"
end

# Get the Sum
# The code below asks the user "What does 2 + 2 equal?" and uses gets to retrieve the user's answer.
# Modify the code so "That's correct!" is printed and the loop stops when the user's answer equals 4.
# Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.
puts
puts "'Get the Sum'"
puts "------------"
puts
loop do
  puts "What does 2 + 2 equal?"
  answer = gets.chomp.to_i
  if answer == 4 #if was added. I originally used if/else but it is unneeded because of break.
    puts "That's correct!"
    break
  end
  puts "Wrong answer. Try again!"
end

# Insert Numbers
# Modify the code below so that the user's input gets added to the numbers array.
# Stop the loop when the array contains 5 numbers.
puts
puts "'Insert Numbers'"
puts "------------"
puts

numbers = []

loop do
  print 'Enter any number: '
  input = gets.chomp.to_i
  numbers << input
  break if numbers.length == 5
end
puts numbers

# Empty the Array
# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contaon any more elements.
puts
puts "'Empty the Array'"
puts "------------"
puts
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.length == 0 # or names.empty?
end

# Stop Counting
# The method below counts from 0 to 4. Modify the block so that it prints the current
# number and stops iterating when the current number equals 2.
puts
puts "'Stop Counting'"
puts "------------"
puts
5.times do |index|
  puts index
  break if index == 2
end

# Only Even
# Using next, modify the code below so that it only prints even numbers.
puts
puts "'Only Even'"
puts "------------"
puts

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# First to Five
# The following code increments number_a and number_b by either 0 or 1.
# loop is used so that the variables can be incremented more than once, however, break stops
# the loop after the first iteration. Use next to modify the code so that the loop iterates until
# either number_a or number_b equals 5. Print "5 was reached!" before breaking out of the loop.
puts
puts "'First to Five'"
puts "------------"
puts
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a < 5 && number_b < 5
  if number_a == 5
    puts "number_a has reached #{number_a}!"
  else
    puts "number_b has reached #{number_b}!"
  end
  break
end

# Greeting
# Given the code below, use a while loop to print "Hello!" twice.
puts
puts "'greeting'"
puts "------------"
puts
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end