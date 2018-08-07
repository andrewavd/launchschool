# When will I retire?

# Build a program that displats when the user will retire and how many years
# she has to work till retirement.

print "=> What is your age? "
age = gets.chomp.to_i
print "=> At what age would you like to retire? "
retire_target = gets.chomp.to_i

years_left = retire_target - age
current_year = Time.now.year
retirement_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_left} years of work to go!"
