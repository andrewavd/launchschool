# First Car
# Create a hash that contains the following data and assign it to a variable named car.
# type: sedan, color: blue, mileage: 80_000
puts
puts "'First Car'"
puts "---------"
puts

car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000,
}

# Adding the Year
# Using the code above, add the key :year and the value 2003 to car.
puts
puts "'Adding the Year'"
puts "---------"
puts

car[:year] = 2003
puts car

# Broken Odometer
# Using the following code, delete the key :mieage and its associated value from car.
puts
puts "'Broken Odometer'"
puts "---------"
puts
car = {
  type: 'sedan',
  color: 'blue',
  mileage: 80_000,
  year: 2003
}

car.delete(:mileage)
puts car

# What Color?
# Using the following code, select the value 'blue' from car and print it with #puts.

puts
puts "'What Color?'"
puts "---------"
puts

car = {
  type: 'sedan',
  color: 'blue',
  year: 2003
}

puts car[:color]

# Labeled Numbers
# Use Hash#each to iterate over numbers and print each element's key/value pair.
puts
puts "'Labeled Numbers'"
puts "---------"
puts

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

numbers.each { |key, val| puts "A #{key} number is #{val}."}

# Divided by Two
# Use Enumerable#map to iterate over numbers and return an array containing each number divided
# by 2. Assign the returned array to a variable named half_numbers and print its value using #p.
puts
puts "'Divided by Two'"
puts "---------"
puts

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

p half_numbers = numbers.map { |key, val| val/2 }

# Low, Medium, or High?
# Use Hash#select to iterate over numbers and return a hash containing only key-value pairs
# where the value is less than 25. Assign the returned hash to a variable naemed low_numbers and
# print its vale using #p.
puts
puts "'Low, Medium, or High?'"
puts "---------"
puts

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

p low_numbers = numbers.select { |key, val| val < 25 }

# Low or Nothing
# In the following code, numbers isn't mutated because #select isn't a destructive method.
# However, there is a destructive version of #select named #select!. Modify the code to 
# use #select! instead of #select.
puts
puts "'Low or Nothing'"
puts "---------"
puts

numbers = {
  high: 100,
  medium: 50,
  low: 10
}

p low_numbers = numbers.select! { |key, val| val < 25 }
p numbers

# Multiple Cars
# Create a nested hash using the following data:
# Car - type: sedan, color: blue, year: 2003 Truck - type: pickup, color: red, year: 1998

vehicles = {
  car: {
    type: 'sedan',
    color: 'blue',
    year: 2003,
  },
  truck: {
    type: 'pickup',
    color: 'red',
    year: 1998,
  }
}

p vehicles

# Which Collection?
# Rewrite car as a nested array containing the same key-vlue pairs.
puts
puts "'Which Collection'"
puts "---------"
puts

car = {
  type: 'sedan',
  color: 'blue',
  year: 2003
}

car_arr = [[:type, sedan], [:color, 'blue'], [:year, 2003]]
