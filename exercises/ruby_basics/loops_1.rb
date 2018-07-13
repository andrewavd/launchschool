# Runaway Loop

# The code below is an example of an infinite loop. The name describes exactly what it does:
# loop infinitely. This loop isn't useful in a real program, though.
# Modify the code so the loop stops after the first itratiion.
puts
puts "'Runaway Loop'"
puts '------------'
puts
loop do
  puts 'Just keep printing...'
  break # my addition
end

# Loopception

# The code below is an example of a nested loop. Both loops currently loop infinitely.
# Modify the code so each loop stops after the first iteration.
puts
puts "'Loopception'"
puts '------------'
puts
loop do
  puts 'This is the outer loop.'
  loop do
    puts 'This is the inner loop.'
    break # my addition
  end
  break # my addition
end

puts 'This is outside the loops.'

# Control the Loop
# Modify the following loop so it iterates 5 times instead of just once.
puts
puts "'Control the Loop'"
puts '------------'
puts
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1 # my addition
  break if iterations > 5 # added the if satement to the break
end

# Loop on Command
# Modify the code below so the loop stops iterating when the user inputs 'yes'.
puts
puts "'Loop on Command'"
puts '------------'
puts
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'yes' # my addition
  puts 'To end loop, answer "yes".' # additional improvement provided in solution.
end

# Say Hello
# Modify the code below so "Hello!" is printed 5 times.
puts
puts "'Say Hello'"
puts '------------'
puts
say_hello = true
count = 1 # My addition

while say_hello
  puts "#{count}) Hello!"
  count += 1
  say_hello = false if count > 5 # I added if modifier
end

# Print While
# Using a while loop, print 5 random numbers between 0 and 99. The code below shows
# an example of how to begin solving this exercise.

# My original way was to create random and print immediately.
# The provided solution was to create an array of randoms and print after.
puts
puts "'Print While'"
puts '------------'
puts
numbers = []
#count = 1
#flag_5 = true

#while flag_5
while numbers.length < 5
  #puts "Random ##{count}) #{rand(100)}"
  #count += 1
  #flag_5 = false if count > 5
  numbers << rand(100)
end

numbers.each_index {|x| puts "Random ##{x+1}) #{numbers[x]}"}

# Count up
# The following code putputs a countdown from 10 to 1.
# Modify the code so that it counts from 1 to 10 instead.
puts
puts "'Count Up'"
puts '------------'
puts
count = 1 # Change from 10 to 1

until count == 11 # Change from 0 to 11
  puts count
  count += 1 # Change to += from -=
end

# Print Until
# Given the array of several numbers below, use an until loop to print each number.
puts
puts "'Print Until'"
puts '------------'
puts
numbers = [7, 9, 13, 25, 18]

until numbers.length == 0
  puts numbers.shift
end

# That's Odd
# The code below shows an example of a for loop. Modify the code so that it only
# outputs i if i is an odd number.
puts
puts "'That's Odd'"
puts '------------'
puts
for i in 1..100
  #puts i if i%2 != 0 (my way)
  puts i if i.odd? # better way!
end

# Greet Your Friends
# Your friends just showed up! Given the following array of names,
# use a for loop to greet each friend individually.
puts
puts "'Greet Your Friends'"
puts '------------'
puts

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends 
  puts "Hello, #{name}!"
end