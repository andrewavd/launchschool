# Write a method that takes one argument, apositive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(length)
  stringy = ''
  length.times { |x| stringy += x.odd? ? '0' : '1' }
  stringy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
