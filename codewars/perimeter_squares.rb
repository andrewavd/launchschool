# perimeter_squares.rb
# November 9, 2018
# 5kyu
# Completion time: 18:39

# Problem:
# The drawing shows 6 squares the sides of which have a length of 1, 1, 2, 3, 5, 8. It's easy to see
# that the sum of the perimeters of these squares is : 4 * (1 + 1 + 2 + 3 + 5 + 8) = 4 * 20 = 80

# The function perimeter has for parameter n where n + 1 is the number of squares (they are numbered 
# from 0 to n) and returns the total perimeter of all the squares.

# Examples:
# perimeter(5) == 80
# perimeter(7) == 216

# Breakdown:
# - need to find the fibonacci sequence from 'n'
# - sum the sequence
# - multiply by for to determine the 'perimeter'.

def create_fib_seq(n)
  result = [1, 1]
  (1..n-1).each { |i| result << result[i] + result[i-1] }
  result
end  

def perimeter(n)
  create_fib_seq(n).sum * 4
end

p  perimeter(5) == 80
p perimeter(7) == 216