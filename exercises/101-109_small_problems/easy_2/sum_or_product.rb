# Sum or product of consecutive integers

# Write a program that asks the user t o entr an interger greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# Further exploration
# A more rubyish way of computing sums and products is with the Enumeracle#inject
# method. #inject is a very useful method, but if you've never used it before, it
# can be difficult to understand. Try to use #inject in your solution to this
# problem.

def calc_sum(num)
  if num <= 1
    1
  else
    num + calc_sum(num - 1)
  end
end

def calc_product(num)
  if num <= 1
    1
  else
    num * calc_product(num - 1)
  end
end

print "=> Please enter an integer greater than 0: "
number = gets.chomp.to_i
print "=> Enter 's' to compute the sum, 'p' to compute the product: "
choice = gets.chomp
if choice == 's'
  puts "The sum of the integers between 1 and #{number} is #{(1..number).inject(:+)} (#inject)."
  puts "The sum of the integers between 1 and #{number} is #{calc_sum(number)} (recursion)."
else
  puts "The product of the integers between 1 and #{number} is #{(1..number).inject(1, :*)} (#inject)."
  puts "The product of the integers between 1 and #{number} is #{calc_product(number)} (recursion)."
end
