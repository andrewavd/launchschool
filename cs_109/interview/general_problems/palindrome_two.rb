# palindrome_two.rb
# November 4, 2018

=begin
Problem:
Using the Ruby language, have the function PalindromeTwo(str) take the str parameter being passed and 
return the string true if the parameter is a palindrome, (the string is the same forward as it is 
backward) otherwise return the string false...

Examples:
"Noel - sees Leon" == true
"A war at Tarawa!" == true

Breakdown:
- Write a method, palindrome_two(str) that takes a string argument.
- Return true if passed argument is a palindrome, false if it is not.
- Ignore all non-alphabetic characters. (implicit from examples above.)
- test is case insensitive (implicit from examples)

Rules:
- A palindrome is a string that reads the same forward and backwards.

Input: a string
Output: boolean, true or false

Algorithm:
- remove all non-alphabetic characters from string.
- String#downcase str to ignore case.
- str == str.reverse is true then palindrome = true

Completion time: 19:30
=end

def palindrome_two(str)
  p pal_str = str.downcase.gsub(/[^a-z]/i, '')
  pal_str == pal_str.reverse
end

# All tests should output 'true'.
p palindrome_two("Noel - sees Leon") == true
p palindrome_two("A war at Tarawa!") == true
p palindrome_two("Andy Holmes") == false