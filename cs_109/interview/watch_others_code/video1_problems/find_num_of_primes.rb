# find_num_of_primes.rb
# October 28, 2018

def is_prime?(n)
  return true if n == 2 || n == 3
  n < 2 || n % 2 == 0 || n % 3 == 0 ? false : true
end

def find_primes(arr)
  arr.select { |n| is_prime?(n) }
end

def count_primes(arr)
  find_primes(arr).size
end

# All tests will output true if they pass.
p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0
p count_primes([3, 9, 11, 17, 18, 21, 29]) == 4