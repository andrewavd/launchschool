# all_substrings.rb
# Write a method that returns a list of all substrings of a string. The returned list should be ordered
# by where in the string the substring begins. This means that all substrings that start at position 0
# should come first, then all stbstrings that start at position 1, and so on. Since multiple substrings
# will occur at each position, the substrings at a given position should be returned in order from
# shortest to longest.
# You may (and should) use the substrings_at_start method you wrote in the previous exercese.

def substrings_at_start(str)
  result = []
  substring = ''
  str.chars.each do |char|
    substring += char
    result << substring
  end
  result
end

def substrings(str)
  result = []
  0.upto(str.size) do |index|
    result << substrings_at_start(str[index..str.size])
  end
  result.flatten
end

p substrings('abcde') # == ['a', 'ab', 'abc', 'abcd', 'abcde', 'b', 'bc', 'bcd', 'bcde', 'c', 'cd', 'cde', 'd', 'de', 'e']
