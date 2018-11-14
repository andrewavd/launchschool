# prime_time.rb
# November 5, 2018

=begin
Problem:
Using the Ruby language, have the function PrimeTime(num) take the num parameter being passed and 
return the string true if the parameter is a prime number, otherwise return the string false...

Examples:
input: 19
output: true

input: 110
output: false

Breakdown:
- Write a method named prime_time(num) that takes an integer as an argument.
- Return boolean 'true' if num is a prime number and 'false' if 'num' is not a prime number.

Rules:
- What is a prime number?
- a prime is a number that is evenly divisible by only itself and 1.
- A prime number is a whole number greater than 1 whose only factors are 1 and itself.

input: an integer > 1
output: a boolean value of true or false

Algorithm:
- Write a method named prime_time that takes an integer 'num' as argument.
- if num is == 2 || 3 return true
- initialize variable prime = true
- if num % 2 == 0 || num % 3 prime = false
- return prime

Tests:
p prime_time(2)
p prime_time(3)
p prime_time(4)
p prime_time(19)
p prime_time(110)

Questions:
- What is the range of input num?

Completion time: 13:54
=end

def prime_time(num)
  num < 2 ? false : (2..Math.sqrt(num)).none? { |i| num % i == 0 }
end

# All tests should output 'true'
p prime_time(2) == true
p prime_time(3) == true
p prime_time(4) == false
p prime_time(19) == true
p prime_time(110) == false
p prime_time(133) == false