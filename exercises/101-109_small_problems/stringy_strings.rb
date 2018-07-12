# Write a method that takes one argument, apositive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Further Exploration
# Modify stringy so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should
# return a String of alternating 0s and 1s, but starting with a 0 instesd of 1.


def stringy(length, switch = 1)
  stringy = ''
  #length.times { |x| stringy += x.odd? ? '0' : '1' } # Original assignment
  length.times { |x| stringy += (x.odd? ? (switch - 1).abs : switch).to_s } # Further exploration
  stringy
end

puts stringy(6)
puts stringy(6) == '101010'
puts stringy(6, 0)
puts stringy(6, 0) == '101010'
puts stringy(9) == '101010101'
puts stringy(9, 0) == '101010101'
puts stringy(4) == '1010'
puts stringy(4, 0) == '1010'
puts stringy(7) == '1010101'
puts stringy(7, 0) == '1010101'
