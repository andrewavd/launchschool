# first_factorial.rb
# November 4, 2018

=begin
Using the Ruby language, have the function FirstFactorial(num) take the num parameter being passed
and return the factorial of it (e.g. if num = 4, return (4 * 3 * 2 * 1)). For the test cases, the 
range will be between 1 and 18 and the input will always be an integer.

Examples:
Input:4
Output:24


Input:8
Output:40320

Breakdown:
- Write a method, first_factorial(num), that takes an integer as an argument.
- first_factorial returns the factorial of that number.
- num will be between 1 & 18
- The factorial of a number is the product of the number and the positive integers that precede it.
- Factorial example of 4: 4 * 3 * 2 * 1 = 24

Input:
- Integer
Output:
- Integer representing the factorial of the input.
Data structure:
n/a

Algorithm:
- Write a method named first_factorial(num) that takes an integer 'num' as an argument.
- if num = 1, return 1
- initialize variable factorial = num
- 1.upto num - 1 do |x|
  - factorial *= num - x
- return factorial


Questions:
- is the range of num, (1..18), inclusive of 1 & 18? Answer = yes.

Completion time: 24:00
=end

def first_factorial_brute(num)
  return 1 if num == 1
  factorial = num
  (num - 1).downto 1 do |i|
    factorial *= num - i
  end
  factorial
end

def first_factorial(num)
  return 1 if num == 1
  num * first_factorial(num - 1)
end

# All tests should output 'true'
p first_factorial(1) == 1
p first_factorial(2) == 2
p first_factorial(4) == 24
p first_factorial(8) == 40320