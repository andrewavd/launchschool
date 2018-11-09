# split_strings.rb
# November 9, 2018
# 6kyu
# Completion time: 8:49

# Problem:
# Complete the solution so that it splits the string into pairs of two characters. If the string 
# contains an odd number of characters then it should replace the missing second character of the 
# final pair with an underscore ('_').

# Examples:
# solution('abc') # should return ['ab', 'c_']
# solution('abcdef') # should return ['ab', 'cd', 'ef']

def solution(str)
  pair = ''
  result = []
  str << '_' if str.length.odd?
  str.each_char.with_index do |c, i|
    pair << c
    if i.odd?
      result << pair
      pair = ''
    end
  end
  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']