# Print Me (Part 1)
# Write a methid named print_me that prints "I'm printing within the method!" when invoked.

def print_me()
  puts "I'm printing within the method!"
end

print_me()

# Print Me (Part 2)
# Write a method named print_me that returns "I'm printing the return value!" when using the
# following code.

def prints_me()
  puts "I'm printing the return value!"
end

puts prints_me()

# Greeting Through Methods (Part 1)
# Write two methods, one that returns the string "Hello" and ont that returns the string "World".
# Then print both strings using #puts, combining them into one sentence.

def print_hello()
  "Hello"
end

def print_world()
  "World"
end

puts "#{print_hello()} #{print_world()}"

# Greeting Through Methods (Part 2)
# Write a method named greet that invokes the following methods:

def hello()
  'Hello'
end

def world()
  'World'
end

def greet()
  greeting = hello() + ' ' + world()
end

puts greet()

# Make and Model
# Using the following code, write a method called car that takes two arguments and prints a string
# containing the values of both arguments.

def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')

# Day or Night
# The variable below will be randomly assignes as true or false. Write a method named time_of_day
# that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and
# "It's nighttime!" if it's false. Pass daylight int the method as the argument to determine whether
# it's day or night.

def time_of_day(daylight)
  daylight ? puts("It's daytime!") : puts("It's nighttime")
end

daylight = [true, false].sample
time_of_day(daylight)

# Naming Animals
# Fix the following code so that the names are printed as expected.

def dog(name)
  name
end

def cat(name)
  name
end

puts "The dog's name is #{dog("Flynn")}."
puts "The cat's name is #{cat("Doe")}."

# Name Not Found
# Write a method tha accepts one argument, but soesn't require it, The parameter should
# default to the string "Bob" if no argument is given. The method's return value should
# be the value of the argument.

def assign_name(name = 'Bob')
  name
end

puts assign_name('Kevin') == 'Kevin'
puts assign_name() == 'Bob'

# Multiply the Sum
# Write the following methods so that each output is true.

def add(x, y)
  x + y
end

def multiply(x, y)
  x * y
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

# Random Sentence
# The variables below are both assigned to arrays. The first one, names, contains a list of names.
# The second one, activities, contains a list of activities. Write the methods nam and activity so
# that they each take the appropriate array ans return a random value from it. Then write the
# method sentence that combines both values into a sentence and returns it from the method.


def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end


def sentence(name, activity)
  name + ' enjoys ' + activity + '.'
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
