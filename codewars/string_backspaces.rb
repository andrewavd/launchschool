# string_backspaces.rb
# November 12, 2018
# 6kyu
# Completion time: 42:04

# Problem:
# Assume "#" is like a backspace in a string. This means that string "a#bc#d" actually is 'bd'.
# Write a method that processes a strin with "#" symbols.

# Examples:
# "abc#d##c"      ==>  "ac"
# "abc##d######"  ==>  ""
# "#######"       ==>  ""
# ""              ==>  ""

def clean_string(str)
  result = []
  str.each_char { |c| c == '#' ? result.pop : result << c }
  result.join
end

p clean_string("abc#d##c") ==  "ac"
p clean_string("abc##d######") ==  ""
p clean_string("#######") ==  ""
p clean_string("") ==  ""