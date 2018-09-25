# leading_substrings.rb
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value
# should be arranged in order from shortest to longest substring.

def substrings_at_start(str)
  result = []
  substring = ''
  str.chars.each do |char|
    substring += char
    result << substring
  end
  result
end

def substrings_at_start_solution(str)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

p substrings_at_start('abc')   # == ['a', 'ab', 'abc']
p substrings_at_start('a')     # == ['a']
p substrings_at_start('xyzzy') # == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
