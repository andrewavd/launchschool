# Write a method that takes a string as an argument and returns the character that occurs most often in the given string. If there are multiple characters with 
# the equal highest number of occurrences, then return the one that appears first in the string. When counting characters, consider the uppercase and lowercase 
# version to be the same.

def most_common_char(str)
  count = 0
  common_char = ''
  str = str.downcase
  str.each_char do |c|
    if str.count(c) > count
      count = str.count(c)
      common_char = c
    end
  end
  common_char
end

p most_common_char("Hello World") == "l"
p most_common_char("Peter Piper picked a peck of pickled peppers") == "p"
p most_common_char("Mississippi") == "i"
p most_common_char("Happy birthday!!!") == '!'