# sumsquare_squaresum.rb
# October 1, 2018

# Write a method tha computes the difference between the square of the sum of the first n
# positive integers and the sum of the squares of the first n positive integers.
# Example:
# n = 3
# (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

def sum_square_difference(num)
  sum_square = 0
  square_sum = 0
  1.upto(num) do |n|
    sum_square += n
    square_sum += n**2
  end
  sum_square**2 -square_sum
end

p sum_square_difference(3)   # == 22
p sum_square_difference(10)  # == 2640
p sum_square_difference(1)   # == 0
p sum_square_difference(100) # == 25164150