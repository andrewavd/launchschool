# Use the each_with_index method to iterate through an array of your creation
# that prints each index and value of the array.

pets = ['Doe', 'Sunny', 'Puff', 'Jammer', 'Popper', 'Whitey', 'Minty']

pets.each_with_index { |name, index| puts "Array index: #{index} Pet name: #{name}" }
