# The following is the content from chapter 7.

# Comparison
puts 1 > 2 #false
puts 1 < 2 #true
puts 5 >= 5 #true
puts 5 <= 4 #false
puts 1 == 1 #true
puts 2 != 1 #true
puts 'cat' < 'dog' #true
puts 'bug lady' < 'Xander' #false, because capitals < lowercase
puts 'bug lady' < 'Xander'.downcase #true
puts 2 < 10 #true
puts '2' < '10' #false, because 1 < 2

# Branching
puts "Hello what's your name?"
name = gets.chomp
puts "Hello, #{name}."
if name == 'Andy'
  puts "#{name} is one of the best names of all time."
end

puts "I'm a fortune teller, please tell me your name."
name = gets.chomp.downcase
if name == 'andy'
  puts "#{name.capitalize}, I see great things in your future!"
else
  puts "Your future is...oh my, look at the time, "
  puts "I really must be going; sorry!"
end

puts "Hello, and welcome to seventh grade English."
puts "My name is Mrs. Gabbard. And your name is....?"
name = gets.chomp
if name == name.capitalize
  puts "Please take a seat #{name}."
else
  puts "#{name}? You mean #{name.capitalize}, right?"
  puts "Don't you even know how to spell your name??"
  reply = gets.chomp
  if reply.downcase == "yes"
    puts "Hmmph, well, sit down!"
  else
    puts "GET OUT!"
  end
end

input = ''
while input != 'bye'
  puts input
  input = gets.chomp
end
puts 'Come again soon!'

while 'Spike' > 'Angel'
  input = gets.chomp
  puts input
  if input == 'bye'
    break
  end
end
puts "Come again soon."

puts "What's your name?"
name = gets.chomp
if name == 'Andy'
  puts "Great name"
elsif name == 'Maris'
  puts "Great name"
end

puts "What's your name?"
name = gets.chomp
if name == 'Andy' || name == 'Maris'
  puts "Great name!"
end 

i_am_andy = true
i_am_purple = false
i_like_beer = false
i_eat_lobster = true

puts i_am_andy && i_like_beer
puts i_like_beer && i_eat_lobster
puts i_am_purple && i_eat_lobster
puts i_am_purple && i_eat_lobster
puts
puts i_am_andy || i_like_beer
puts i_like_beer || i_eat_lobster
puts i_am_purple || i_like_beer
puts i_am_purple || i_eat_lobster
puts
puts !i_am_purple
puts !i_am_andy

while true
  puts 'What would you like C to do?'
  request = gets.chomp

  puts "You say, \"C, please #{request}\""
  puts "C's response:"
  puts "\"C #{request}.\""
  puts "\"Papa #{request}, too.\""
  puts "\"Mama #{request}, too.\""
  puts "\"Maris #{request}, too.\""
  puts "\"Nono #{request}, too.\""
  puts "\"Emma #{request}, too.\""
  if request == 'stop'
    break
  end
end
