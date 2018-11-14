# prime_mover.rb
# November 4, 2018

=begin
Using the Ruby language, have the function PrimeMover(num) return the numth prime number...

Examples:
input: 9
Output: 23

input: 100
output: 541

Breakdown:
- Given an integer num, find the numth prime number.
- If num = 2, then 3 is the answer. primes = (2, 3, etc)

Input: an integer
Output: an integer representing the nth prime number in the series of primes.

Rules:
- A prime number is a whole number greater than 1 whose only factors are 1 and itself.

Algorithm:
- Write a method to determine if a number is a prime.
 - input is an integer greater than 1
 - output is true or false.

- Write a method, prime_mover that takes an integer 'num'
- initalize a variable: prime_count = 0
- initalize a variable: iteration_count = 0
- initialize a variable current_num = 2
- loop until series count == num
  - call is_prime(current_num)
    - if return is true, series_count +=1
    - if series_count == num, break loop
- return current_num
=end

def is_prime?(n)
  n < 2 ? false : (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end

def prime_mover(n)
  result = [2, 3]
  i = 5
  until result.size == n
    result << i if is_prime?(i)
    i += 1
  end
  result.last
end

p prime_mover(3) == 5
p prime_mover(9) == 23