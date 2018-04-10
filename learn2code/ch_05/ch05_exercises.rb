# The following are the exercises from chapter 5.

# Full name greeting
puts "What is your first name?"
first_name = gets.chomp
puts "What is your middle name?"
middle_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello #{first_name} #{middle_name} #{last_name}, it's a pleasure to meet you."

# Bigger, better favorite number.
puts "What is your favorite number?"
fav_num = gets.chomp.to_i
#better_num = fav_num.to_i + 1
#puts "#{fav_num} is a great number but I would suggest that #{better_num} is better!"
puts "#{fav_num} is a great number but I would suggest that #{fav_num + 1} is better!"
