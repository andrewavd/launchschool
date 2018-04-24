# Using some of Ruby's built-in Hash methods, write a program that loops
# through a hash and prints all of the keys. Then write a program that
# does the same thing except printing the values. Finally, write a program that prints both.


pets = {
  cat: 'Doe',
  fish: "Sunny",
  dog: "Jammer"
}

# print hash keys
puts "keys"
puts "----"
#pets.keys.each { |k| puts k }
pets.each_key { |k| puts k }
puts

# print hash values
puts "values"
puts "------"
#pets.values.each { |v| puts v }
pets.each_value { |v| puts v }
puts

# print hash keys and values
puts "keys and values"
puts "---------------#"
pets.each { |k, v| puts "#{k}: #{v}" }