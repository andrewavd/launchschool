# This is a comment.

=begin
  This is a 
  multi-line comment.
=end

# Styling: Ruby uses "snake_case" styling for variables, methods and files.
# CONSTANTS are denoted by all caps.
#ClassNames use CamelCase.

puts "Hello world!"

# do..end blocks - prefer {} when using single line.
[1,2,3].each {|i| puts i}

[4,5,6].each do |i|
  puts i    
end

# Data types: numbers, booleans and strings.

my_num = 25

my_boolean = false

my_string = "Andy"

puts my_num
puts my_boolean
puts my_string

# print and puts

puts "\"puts\". What's up!"
print "\"print\". Andy is great."
puts "\"puts\". This is the life."
print "\"print\". Last line."
puts ""

# input and output

puts "Properly capitalize input."
puts ""
print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!
print "What's your last name? "
last_name = gets.chomp
last_name.capitalize!
print "What city do you live in? "
city = gets.chomp
city.capitalize!
print "Please enter the 2 letter abbreviation for your state: "
state = gets.chomp
state.upcase!

puts "Your name is #{first_name} #{last_name}. You live in #{city}, #{state}."

# "Daffify" some input
=begin
  If 'c' precedes the letters e, i, y
  in the input you could also 'Daffify"
  it as it is probaby a 'soft c'.
=end

puts "STRING \"DAFFIFICATION\""
puts ""
user_input = ""
flag = false

while user_input == ""
  print "Please enter some text: "
  user_input = gets.chomp
end

#user_input.downcase!

if user_input.include? ("s") || user_input ("S")
  user_input.gsub!(/s/, "th")
  user_input.gsub!(/S/, "Th")
  flag = true
else
  puts "There is no 's' in your input."
end

#user_input.capitalize!

if flag
	puts "Your 'Daffified' input is: #{user_input}"
else
  puts "Your input is unchanged: #{user_input}"
end

# Redact some input
puts ""
puts "Redact example"
puts ""

puts "Please enter some text: "
text = gets.chomp

puts "Please enter word to redact: "
redact = gets.chomp

words = text.split(" ")

words.each do |word|
  if word == redact
    print "REDACTED "
  else   
  	print "#{word} "
  end
end
