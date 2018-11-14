# Write a method that takes a string as an argument and returns the character that occurs most often in the given string. If there are multiple characters with
# the equal highest number of occurrences, then return the one that appears first in the string. When counting characters, consider the uppercase and lowercase
# version to be the same.

=begin

=end

def most_common_char(str)
  str = str.downcase
  hsh = {}
  hi_cnt = 0
  result = ''
  
  str.each_char { |char| hsh.has_key?(char) ? hsh[char] += 1 : hsh[char] = 1 }
  hsh.each_pair do |k, v|
    if v > hi_cnt
      result = k
      hi_cnt = v
    end
  end
  result
end

# Examples:

p most_common_char("Hello World") == "l"
p most_common_char("Peter Piper picked a peck of pickled peppers") == "p"
p most_common_char("Mississippi") == "i"
p most_common_char("Happy birthday!!!") == '!'

# The tests above should print "true".