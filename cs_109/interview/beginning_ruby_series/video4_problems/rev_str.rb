# rev_str.rb
# October 25, 2018

# Write a method that takes a string as an argument and returns the string in reverse order.
# Do not use String#reverse.

# Questions/assumptions:
# - We are mutating the string? Answer: no.
# - We are not handling non-strings.

def rev_str(str)
  result = ''
  str.each_char { |char|  result = char + result }
  result
end


p rev_str('Andy is a student at Launchschool.')
p rev_str('abba')
p rev_str('superduper')
