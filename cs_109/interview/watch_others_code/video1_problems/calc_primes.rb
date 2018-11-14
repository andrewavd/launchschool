# calc_primes.rb
# October 28, 2018

def is_prime?(n)
  return true if n == 2 || n == 3
  n < 2 || n % 2 == 0 || n % 3 == 0 ? false : true
end

# Outputs will all be "true" if tests pass.
p is_prime?(3) == true
p is_prime?(4) == false
p is_prime?(0) == false