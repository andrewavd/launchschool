# backwards_primes.rb
# November 13, 2018
# 6kyu
# Completion time: 0:00

# Problem:
=begin
Backwards Read Primes are primes that when read backwards in base 10 (from right to left) are a different prime. (This rules out primes which are palindromes.)

Examples:
13 17 31 37 71 73 are Backwards Read Primes
13 is such because it's prime and read from right to left writes 31 which is prime too. Same for the others.

Task
Find all Backwards Read Primes between two positive given numbers (both inclusive), the second one always being greater than or equal to the first one. The resulting array or the resulting string will be ordered following the natural order of the prime numbers.

Example
backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97] backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967] backwardsPrime(501, 599) => []

Don't use Ruby Prime class, it's disabled.
backwardsPrime(2, 100) => [13, 17, 31, 37, 71, 73, 79, 97] 
backwardsPrime(9900, 10000) => [9923, 9931, 9941, 9967]
=end

def is_prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

def backwards_prime(start, stop)
  f_primes = []
  b_primes = []
  (start..stop).each do |n|
    f_primes << n if is_prime?(n)
  end
  f_primes.each do |n|
    p test = n.to_s.reverse.to_i
    b_primes << test if is_prime?(test) && test >= start && test <= stop
  end
  p b_primes
end

backwards_prime(7000, 7100) == [7027, 7043, 7057]