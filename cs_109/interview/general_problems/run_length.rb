# run_length.rb
# November 4, 2018

=begin
Problem:
Using the Ruby language, have the function RunLength(str) take the str parameter being passed and 
return a compressed version of the string using the Run-length encoding algorithm...

Examples:
Input:"aabbcde"
Output:"2a2b1c1d1e"

Input:"wwwbbbw"
Output:"3w3b1w"

Breakdown:
- Write a method run_length(str) that takes a string argument.
- For each ooccurrence of consecutive characters output the number of times that character occurs 
    followed by the character. If a character occurs only once then output 1 followed by the character
- Each output of number/character will be output as 1 string, not individually.
- See examples for clarification.

Input: string of alphabetic characters.
Output: sting of characters representing the number of occurrences of consecutive characters followed
 by tht character.
Data Structure: a sting 'built up" from smaller strings.

Rules:
- The input string will be made up of characters.

Algorithm:
- Write a method, run_length(str) that takes a string as an argument.
- initialize a varible, result = ''
- initialize a variable, char_count = 1
- Iterate thru string: str.each_char.with_index
- Compare current element with next element in str: e == str[i+1]
- if e == str[i+1] count += 1 else result << count << e and reset count = 1
- return result

Tests:
p run_length('aabbcde')
p run_length('wwwbbbw')

Question:
- Will str be empty? If so, what is the return?

=end

def run_length(str)
  result = ''
  char_count = 1
  str.each_char.with_index do |char, i|
    if char == str[i + 1]
      char_count += 1
    else
      result << char_count.to_s << char
      char_count = 1
    end
  end
  result
end

# All tests should output 'true'.
p run_length('') == ''
p run_length('aabbcde') == '2a2b1c1d1e'
p run_length('wwwbbbw') == '3w3b1w'
p run_length('www   bbbw') == '3w3 3b1w'