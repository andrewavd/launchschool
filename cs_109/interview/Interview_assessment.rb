# Write a method that takes a string as an argument and returns the character that occurs most often in the given string. If there are multiple characters with 
# the equal highest number of occurrences, then return the one that appears first in the string. When counting characters, consider the uppercase and lowercase 
# version to be the same.

=begin
Breakdown:
- Write a method that takes a string as an argument.
- The character that appears most often in the given string.
- Return the character that ccurs most often

Input: String
Outputs: String that contains the character that occurs most often in the Input string.
Data Structure: hash to store the character encountered and the count.

Rules:
- If there are multiple equal high occurences of the same character, return the first character with that high occurrence. Example: 'aabccd' multiple occurrences of 'a' and 'c' would return 'a' becuase we encoountered it first.
- test is case insensitive.

algo:
- Write a method, most_common_char(str) that takes a string.
- Initialize a variable to track charcter higheest count, hsh = {}
- Iterate thru str to count occurrences of each character. str.each_char
  - check hash key if key has alreafy been encounterd
    - if true += 1 for that keys value.
    - if false add key to hash
- check the hash fo the value with the highest value

Question:
spaces count
=end

def most_common_char(str)
  result = ''
  hsh = {}
  count = 1
  str.each_char do |char|

    if hsh.has_key?(char)
      hsh[char.downcase] += 1
    else
      hsh[char.downcase] = count
    end
  end
  hi_val = 0
  hsh.each_pair do |k, v|
     if hsh[k] > hi_val
      result = k
      hi_val = hsh[k]
     end
    end
  p result
end

# Examples:

p most_common_char("Hello World") == "l"
p most_common_char("Peter Piper picked a peck of pickled peppers") == "p"
p most_common_char("Mississippi") == "i"
p most_common_char("Happy birthday!!!") == '!'

# The tests above should print "true".