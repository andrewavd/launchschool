# New Pet
# Select 'fish' from pets, assign the return value to a variable named my_pet,
# then print the value of my_pet.
puts
puts "'New Pet'"
puts "-------"
puts

pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets[pets.index('fish')]
puts "I have a pet #{my_pet}!"

# More Than One
# Select 'fish' and 'lizard' from pets at the same time, assign the return value to a variable
# named my_pets, then print the value of my_pets.
puts
puts "'More Than One'"
puts "-------"
puts

pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."

# Free the Lizard
# Remove 'lizard' from my_pets then print the value of my_pets.

puts
puts "'Free the Lizard'"
puts "-------"
puts

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop

puts "I have a pet #{my_pets[0]}!"

# One Isn't Enough
# Using the code below, select 'dog' from pets, add the return value to my_pets, then
# print the value of my_pets.
puts
puts "'One Isn't Enough'"
puts "-------"
puts

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets << pets[1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# What Color Are You?
# Use Array#each to iterate over colors and print each element.
puts
puts "'What Color Are You?'"
puts "-------"
puts

colors = ['red', 'yellow', 'purple', 'green']

colors.each { |color| puts "I'm the color #{color}!"}

# Doubled
# Use Array#map to iterate over numbers and return a new array with each number doubled.
# Assign the returned array to a variable named dubled_numbers and print its value using #p.
puts
puts "'Doubled'"
puts "-------"
puts

numbers = [1, 2, 3, 4, 5]
p doubled_numbers = numbers.map { |x| x * 2 }

# Divisible by Three
# Use Array#select to iterate ovr numbers and return a new array that contains only numbers
# divisible by three. Assign the returned array to a variable named divisibe_by_three and
# print its value using #p.

puts
puts "'Divisible by Three'"
puts "-------"
puts

numbers = [5, 9, 21, 26, 39]

p numbers.select { |x| x % 3 == 0 }

# Favorite Number (Part 1)
# The following array contains three names and numbers. Group each name with the number following
# it by placing the pair in their own array. Then create a nested array containing all three groups.
# What soes this look like? (You don't need to write any code here. Just alter the value shown so
# it meets the exercise requirements.)
puts
puts "'Favorite Number (Part 1)'"
puts "-------"
puts

nest_arr = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# Favorite Number (Part 2)
# Use Array#flatten t flatten favorites so that it's no longer a nested array. Then assign the
# flattened array to a variable named flat_favotites and print its value using #p.
puts
puts "'Favorite Number (Part 2)'"
puts "-------"
puts

favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
p flat_favotites = favorites.flatten

# Are We the Same?
# Compare array1 and array2 and print true or false based on whether they match.
puts
puts "'Are We the Same?'"
puts "-------"
puts

array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2
puts array1.eql?(array2)
