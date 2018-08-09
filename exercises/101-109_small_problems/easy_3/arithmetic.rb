# Arithmetic Integer

# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient and power. Do not worry about
# validating the input.

# Discussion
# There are some edge cases to consider in this exercise. We have to be careful
# of not having a second number that is zero. (for division anyway) Waht if we
# wanted to use floats instead of integers? How does this change the problem?

def prompt(msg)
  print "==> #{msg}"
end

prompt "Enter the first number: "
# num1 = gets.chomp.to_i
num1 = gets.chomp.to_f
prompt "Enter the second number: "
# num2 = gets.chomp.to_i
num2 = gets.chomp.to_f

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
# original puts "#{num1} / #{num2} = #{num1 / num2}"
if num2 == 0
  puts "Sorry... You can't divide by zero!"
  puts "#{num1} / #{num2} = ERR"
  puts "#{num1} % #{num2} = ERR"
else
  puts "#{num1} / #{num2} = #{num1 / num2}"
  puts "#{num1} % #{num2} = #{num1 % num2}"
end
puts "#{num1} ** #{num2} = #{num1 ** num2}"
