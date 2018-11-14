# find_primes.rb
# October 28, 2018

def is_prime?(n)
  return true if n == 2 || n == 3
  n < 2 || n % 2 == 0 || n % 3 == 0 ? false : true
end

def select_primes(arr)
  arr.select { |n| is_prime?(n) }
end

# All outputs should be true if tests pass
p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10]) == []