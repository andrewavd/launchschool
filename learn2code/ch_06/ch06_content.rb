# Learn to Program - Second Edition : Chapter 6, by Chris Pine
# Following is the content from chapter 6
# The output is unlikely to make sense unless the code is being followed.

puts "The following output may not make much sense unless you are following along with the code."

puts "The following is a list of methods we have seen/used so far:"
puts "1. puts"
puts "2. gets"
puts "3. to_i"
puts "4. to_s"
puts "5. to_f"
puts "6. chomp"
puts "7. +"
puts "8. -"
puts "9. *"
puts "10. /"

puts "hello ".+"world"
puts ((10.*9).+9)

puts self

var1 = "stop"
var2 = "deliver repaid desserts"
var3 = "....TCELES B HSUP A magic spell?"

puts var1.reverse
puts var2.reverse
puts var3.reverse
puts var1
puts var2
puts var3


puts "What is your full name?"
full_name = $stdin.gets.chomp
#puts "What is your first name?"
#first_name = $stdin.gets.chomp
##puts "What is you middle name?"
#middle_name = $stdin.gets.chomp
#puts "What is your last name?"
#last_name = $stdin.gets.chomp
#puts "Did you know there are " + full_name.length.to_s + " characters "
#puts "Did you know there are #{(first_name+middle_name+last_name).length} characters "
puts "Did you know there are #{full_name.length} characters "
puts "in your name, " + full_name + " ?"

letters = "aAbBcCdDeE"
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize
puts " a".capitalize
puts letters

line_width = 50
puts "Old mother hubbard".center(line_width)
puts "Sat in her cupboard".center(line_width)
puts "Eating her curds and why".center(line_width)
puts "When along came a spider".center(line_width)
puts "Who sat down beside her".center(line_width)
puts "And scared her poor shoe dog away.".center(line_width)

line_width = 40
str = "--> text <--"
puts str.ljust(line_width)
puts str.center(line_width)
puts str.rjust(line_width)
puts str.ljust(line_width/2) + str.rjust(line_width/2)

# higher math (optional)
puts 5**2
puts 5**8.5
puts 7/3
puts 7%3
puts 365%7
puts 10.2%3

puts (5 - 2).abs
puts (5 - 7).abs

# random numbers
puts rand
puts rand
puts rand
puts rand(100)
puts rand(100)
puts rand(100)
puts rand(1)
puts rand(1)
puts rand(1)
puts rand(9999999999999999999999999999999999999)
puts "The weatherman said there is a "
puts rand(101).to_s + "% chance of rain,"
puts "but you can never trust a weatherman."

srand 1976
puts rand(100)
puts rand(100)
puts rand(100)
puts rand(100)
puts ''
srand 1976
puts rand(100)
puts rand(100)
puts rand(100)
puts rand(100)

puts Math::PI
puts Math::E
puts Math.cos(Math::PI/3)
puts Math.tan(Math::PI/4)
puts Math.log(Math::E**2)
puts (1 + Math.sqrt(5))/2
