# step_primes.rb
# November 9, 2018
# 6kyu
# Completion time: 0:00

# Problem:
# The prime numbers are not regularly spaced. For example from 2 to 3 the step is 1. From 3 to 5 the
# step is 2. From 7 to 11 it is 4. Between 2 and 50 we have the following pairs of 2-steps primes:
# 3, 5 - 5, 7, - 11, 13, - 17, 19, - 29, 31, - 41, 43

# We will write a function step with parameters:
# g (integer >= 2) which indicates the step we are looking for,
# m (integer >= 2) which gives the start of the search (m inclusive),
# n (integer >= m) which gives the end of the search (n inclusive)

# In the example above step(2, 2, 50) will return [3, 5] which is the first pair between 2 and 50 with
# a 2-steps.
# So this function should return the first pair of the two prime numbers spaced with a step of g between
# the limits m, n if these g-steps prime numbers exist otherwise nil.

# Examples:
# step(2, 5, 7) == [5, 7]
# step(2, 5, 5) == nil
# step(4, 130, 200) == [163, 167]

def is_prime?(n)
  n < 2 ? false : (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

def step(g, m, n)
  (m..n).each { |i| return [i, i + g] if is_prime?(i) && is_prime?(i + g) && i + g <= n }
  nil
end

p step(2, 2, 50) == [3, 5]
p step(2, 5, 7) == [5, 7]
p step(2, 5, 5) == nil
p step(4, 130, 200) == [163, 167]
p step(6,100,110) == [101, 107]