# Learn to Program - Second Edition : Chapter 5, by Chris Pine
# The following is content from chapter 5.
# The output is unlikely to make sense unless the code is being followed.

puts "The following output may not make much sense unless you are following along with the code."

var1 = 2
var2 = '5'
puts var1.to_s + var2

puts var1 + var2.to_i

puts '25'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i
puts 'Who asked you about 5 or whatever?'.to_i
puts 'Your momma did.'.to_f
puts ''
puts 'stringy'.to_s
puts 3.to_i

#puts gets

puts "Hello there, and what's your name?"
name = gets
puts "Your name is " + name + "? What a lovely name!"
puts "Pleased to meet you, " + name + ". :)"

puts "Hello there, and what's your name?"
name = gets.chomp
puts "Your name is " + name + "? What a lovely name!"
puts "Pleased to meet you, " + name + ", :)"
