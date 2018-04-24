# What method could you use to find out if a Hash contains a
# specific value in it? Write a program to demonstrate this use.

# Answer: .has_value?()

pets = {
  cat: 'Doe',
  dog: 'Jammer',
  fish: 'Sunny'
}

puts "\"Doe\" is a value in hash pets." if pets.has_value?("Doe")
