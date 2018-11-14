# odd_word.rb
# October 16, 2018

# Step 1 - Problem write up.
# A) Original write up:
# Consider a character set consisting of letters, a space, and a point. Words consist of one or
# more, but at most 20 letters. An input text consists of one or more words separated from each
# other by one or more spaces and terminated by 0 or more spaces followed by a point. Input
# should be read from, and including, the first letter of the fitst word, up to and including
# the terminating point. The output text is to be produced such that successive words are 
# separated by a single space with the last word being terminated by a single point. Odd words
# are copied in reverse order while even words are merely echoed.

# B) Breakdown:
# - character set = letters, space, point(period)
# - words = 1 to 20 letters, inclusive.
# - input set = 1 or more words seperated by 1 or more spaces.
# - input set termination = 0 or more spaces followed by a period.
# - read input from first letter of first word upto and including the terminating point.
# - The output text is such that:
#   i) successive words are separated by a single space.
#   ii) the last word is followed by a period with no spaces between it and the period.
#   iii) odd words are to be reversed.
#   iv) even words are echoed without change.

# C) Input/Output types and examples: (2 minimum)
# Input type: 'string' Output type: 'string'
# Examples:
# Input: 'whats the matter with kansas.' Output: 'whats eht matter htiw kansas.'
# Input: '   andrew  wendall   holmes  .' Output: 'andrew lladnew holmes.'

# Step 2 - Approach:
# Write a method that takes a string as an argument. Within the method, call the #squeeze(' ') 
# method on the string to remove 'extra' spaces. Remove the period with #delete('.'). Remove
# any spaces before the first letter of the string and the last letter with #strip. Convert
# the string to an array containing only the words using #split. Iterate through the array and
# use #reverse on each odd word. Convert the array back to a string using #join(' '). Add a 
# '.' back to the end of the string. Return the result.

# Step 3 - Test cases:
# reverse_odd_word('whats   the matter   with kansas .') == 'whats eht matter htiw kansas.'
# reverse_odd_word('   whats   the matter   with kansas .') == 'whats eht matter htiw kansas.'
# reverse_odd_word('andy.') == 'andy.'
# reverse_odd_word('   andrew  wendall   holmes  .') == 'andrew lladnew holmes.'

# Step 4 - Layout code (pseudo code)

# Step 5 - Let's code!

def reverse_odd_word(str)
  return '' if str.empty?
  result = (str.squeeze(" ").delete('.').strip).split(' ')
  result.map.with_index { |word, idx| idx.odd? ? word.reverse : word }.join(' ') << '.'
end

puts reverse_odd_word('whats   the matter   with kansas .') == 'whats eht matter htiw kansas.'
puts reverse_odd_word('   whats   the matter   with kansas .') == 'whats eht matter htiw kansas.'
puts reverse_odd_word('andy.') == 'andy.'
puts reverse_odd_word('   andrew  wendall   holmes  .') == 'andrew lladnew holmes.'
puts reverse_odd_word('') == ''

# Step 6 - Test code:

# Step 7 - Refactor:

# Step 8 - Consider edge cases:

# Questions:
# - What constitutes odd/even? Place in sentence or index? A: index in this case.
# - Are we mutating the string? A: no.
# - Are we checking for invalid inputs?
#   > non string? (check data type)
#   > What if a word is > 20 chars? (cneck boundary)
#   > What if string is empty? (check emptiness)
#   > What if string does not end with '.'? (check boundary)