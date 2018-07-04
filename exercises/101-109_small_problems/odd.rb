# odd.rb

# Write a method that takes one integer argument, which may be positive,
# negative or zero. This method returns true if the number's absolute value
# is odd. You may assume that the argument is a valid integr value.

def is_odd?(int)
  int % 2 != 0
end

num = [2, 5, -17, -8, 0, 7]

num.each do |n|
  puts(is_odd?(n))
end
