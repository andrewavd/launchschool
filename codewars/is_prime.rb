# is_prime.rb
# November 10, 2018
# 6kyu
# Completion time: 1:44

# Problem:
#

def is_prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

p is_prime?(133) == false
p is_prime?(0) == false
p is_prime?(1) == false
p is_prime?(2) == true
p is_prime?(7) == true