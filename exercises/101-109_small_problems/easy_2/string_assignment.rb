# String assignment
# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# => 'Alice'
# => 'Bob'

puts "----------"

name_1 = 'Bob'
save_name_1 = name_1
name_1.upcase!
puts name_1, save_name_1

# => 'BOB'
# => 'BOB'
