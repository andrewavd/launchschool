# substrings.rb
# October 18, 2018

# Step 1 - Problem write up.
# A) Original write up:
# Write a method that returns a list of all substrings of a string. The returned list should be
# ordered by where in the string the substring begins. This means that all substrings that
# start at position 0 should come first, then all substrings that start at position 1, and so
# on. Since multiple substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.

# Examples:
# substrings('abcde');
# Result:
# ['a', 'ab', 'abc', 'abcd', abcde,
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'e']


# B) Breakdown:
# - Write a method named substrings(string)
# - iterate through the string.
# - iterater through the remainder of the string creating sub strings.

# C) Input/Output types and examples: (2 minimum)
# Input type: string Output type: array of strings
# Examples:
# Input: Output:
# Input: Output:

# Step 2 - Approach: (Develop your algorithm.)
# Written synopsis:
#

# Data Structures:
# Input data: string
# Rules/requirements as data:
# array of strings

# Algorithm:
# 1) 
# 2)


# Step 3 - Test cases:
# substrings('abcde')
# ['a', 'ab', 'abc', 'abcd', abcde,
#  'b', 'bc', 'bcd', 'bcde',
#  'c', 'cd', 'cde',
#  'e']

# Step 4 - Layout code (pseudo code)
# 

# Step 5 - Let's code!
def substrings(str)
  result = []
  subs = ''
  idx = 0
  outer_idx = 0
  loop do
    idx = outer_idx
    loop do
      subs += str[idx]
      result << subs
      idx += 1
      if idx == str.size
        break
      end
    end
    outer_idx += 1
    subs = ''
    if outer_idx == str.size
      break
    end
  end
  result
end

p substrings('abcde')

# Step 6 - Test code:

# Step 7 - Refactor:

# Step 8 - Consider edge cases:

# Questions/assumptions:
# 