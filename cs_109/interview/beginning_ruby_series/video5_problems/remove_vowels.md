remove_vowels.rb
October 27, 2018

Problem:
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels removed.

Create an array of words to send to the method as an argument.

Breakdown/rules:
- (x)Write a method named remove_vowels that takes an array of strings as an argument.
- ()The method returns the array with each word having had its vowels removed.
- (x)Create a test array of words to be processed by remove_vowels method.

input: array of strings
  - Example input: ['green', 'yellow', 'black', 'white']
output/return: array of strings
  - Example output: ['grn', 'yllw', 'blck', 'wht']
data structures: ~~??? VOWELS = %w(a e i o u)~~ Not needed as we can delete desired characters from the word with String#delete.

algorithm:
1. Iterate through through arr_strs. arr_strs.map
2. delete any vowels from each word. word.delete "aeiou"

assessment/tests/sandbox:

Questiions/assumptions:
- Why?

Reflections:
Basic concept was correct out of the box but did not need to set up a vowels constant to check against as `String#delete "aeiou"` allows for 1 step removal.
