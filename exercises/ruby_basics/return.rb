# Breakfast, Lunch, or Dinner

# Part 1
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 1"
puts "---------------------------"
puts

def meal
  return 'Breakfast'
end

puts "My answer: Breakfast"
puts "Solution:"
puts meal

# Part 2
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 2"
puts "---------------------------"
puts

def meal
  'Evening'
end

puts "My answer: Evening"
puts "Solution:"
puts meal

# Part 3
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 3"
puts "---------------------------"
puts

def meal
  return 'Breakfast'
  'Denner'
end

puts "My answer: Breakfast"
puts "Solution:"
puts meal

# Part 4
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 4"
puts "---------------------------"
puts

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts "My answer: \nDinner\nBreakfast"
puts "Solution:"
puts meal

# Part 5
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 5"
puts "---------------------------"
puts

def meal
  'Dinner'
  puts 'dinner'
end

puts "My answer: \nDinner\nnil"
puts "Solution:"
p meal

# Part 6
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Breakfast, Lunch, or Dinner"
puts "Part 6"
puts "---------------------------"
puts

def meal
  return 'Breakfast'
  'Denner'
  puts 'Dinner'
end

puts "My answer: Breakfast"
puts "Solution:"
puts meal

# Counting Sheep
# Part 1
# What will the following code print? Why? Don't run it until you;ve attempted to answer.

puts
puts "Counting Sheep"
puts "Part 1"
puts "--------------"
puts

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts "My answer: I don't know."
puts """What ends up happening here is that 0 - 4 is printed in the function count_sheep.
The function returns the integer that the #times method is run on. In this case that is 5."""

puts "Solution: "
puts count_sheep

# Part 2
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Part 2"
puts "--------------"
puts

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts "My answer: \n0\n1\n2\n3\n4\n10"
puts "Solution:"
puts count_sheep

# Part 3
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Part 3"
puts "--------------"
puts

def count_sheep
  5.times do |sheep|
  puts sheep
    if sheep >= 2
      return
    end
  end
end

puts "My answer \n0\n1\n2\nnil"
puts "The reason the last value is nil is because return did not return a value!"
puts "Solution:"
p count_sheep

# Tricky Number
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts
puts "Tricky Number"
puts "--------------"
puts

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts "My answer: 1 Number = 1 is the last statement evaluated in the function so it is returned."
puts "Solution:"
puts tricky_number