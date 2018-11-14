# count_digit.rb
# November 7, 2018
# 7kyu
# Completion time: 12:33

# Problem:
# Take an integer n (n >= 0) and a digit d (0 <= d <= 9) as an integer. Square all numbers
# k (0 <= k <= n) between 0 and n. Count the numbers of digits d used in the writing of all the k**2.
# Call nb_dig (or nbDig or ...) the function taking n and d as parameters and returning this count.

# Examples:
# n = 10, d = 1, the k*k are 0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100
# We are using the digit 1 in 1, 16, 81, 100. The total count is then 4.

# nb_dig(25, 1):
# The numbers of interest are: (The numbers that when squared, will contain a 1. d = 1)
# 1, 4, 9, 10, 11, 12, 13, 14, 19, 21 which squared are 1, 16, 81, 100, 121, 144, 169, 196, 361, 441
# so there are 11 digits `1` for the squares of numbers between 0 and 25.

def nb_dig(n, d)
  count = 0
  (0..n).each { |num| count += (num ** 2).to_s.count(d.to_s) }
  count
end

p nb_dig(25, 1) == 11
p nb_dig(5750, 0) == 4700
p nb_dig(11011, 2) == 9481
p nb_dig(12224, 8) == 7733
p nb_dig(11549, 1) == 11905