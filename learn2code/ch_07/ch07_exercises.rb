# 99 botles of beer on the wall
puts "How many bottles do you wish to start with?"
bottles = gets.chomp.to_i

while bottles > 0
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer,"
  puts "take one down, pass it around, #{bottles - 1} bottles of beer on the wall!"
  puts
  bottles -= 1
end

# Deaf Grandma
bye_count = 0
while bye_count < 3
  year = rand(22) + 1930
  puts "What would you like to say to Grandma?"
  statement = gets.chomp
  if statement == 'BYE'
    if bye_count < 2
      puts "Grandma is ignoring you!"
    end
    bye_count += 1
  elsif statement == statement.upcase
    puts "Grandma says: \"NO, NOT SINCE #{year}!\""
    bye_count = 0
  else
    puts "Grandma says: HUH?! SPEAK UP SONNY!"
    bye_count = 0
  end
end

puts "Grandma says: GOOD BYE!"


# Leap years
print "Please enter a beginning year: "
start_year = gets.chomp.to_i
print "Please enter an ending year: "
end_year = gets.chomp.to_i

puts
puts "Between #{start_year} and #{end_year} (inclusive), the following are leap years:"
puts

for x in start_year..end_year
  if (x%4 == 0 && x%100 != 0) || (x%4 == 0 && x%100 == 0 && x%400 == 0)
    puts "#{x} is a leap year."
  end
end
