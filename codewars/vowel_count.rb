# vowel_count.rb
# November 12, 2018
# 6kyu
# Completion time: 0:00

# Problem:
=begin
Return the number (count) of vowels in the given string.

We will consider a, e, i, o, and u as vowels for this Kata.

The input string will only consist of lower case letters and/or spaces.
=end

def get_count(str)
  str.count('aeiou')
end

p get_count("abracadabra") == 5
