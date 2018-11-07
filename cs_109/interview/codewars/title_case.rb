# title_case.rb
# November 7, 2018
# 6kyu
# Completion time: 21:10

# Problem:
# A string is considered to be in title case if each word in the string is either (a) capitalised
# (that is, only the first letter of the word is in upper case) or (b) considered to be an exception 
# and put entirely into lower case unless it is the first word, which is always capitalised.

# Write a function that will convert a string into title case, given an optional list of exceptions
# (minor words). The list of minor words will be given as a string with each word separated by a space.
# Your function should ignore the case of the minor words string -- it should behave in the same way
# even if the case of the minor word string is changed.

# NOTES:
# I purposely chose not to use `String#capitalize` because there is a potential issue with intended
# capitalized letters that are not the initial character in a word. The commented out test below 
# demostrates this: 'javaScript', the 'S' character is purposefully capitalized. If one employs the
# .capitalize method, then 'S' will become a problem.

def title_case(title, minor_words = '')
  return '' if title.empty?
  arr = title.downcase.split(' ')
  minor_words.downcase!
  arr[0][0] = arr[0][0].upcase
  (1..arr.size - 1).each do |i|
    arr[i][0] = arr[i][0].upcase unless minor_words.split(' ').include?(arr[i])
  end
  arr.join(' ')
end

p title_case('') == ''
p title_case("First a of in", "an often into") == 'First A Of In'
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In')  == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
# title_case('javaScript: javaScript is the boss!', 'is the') == 'JavaScript: JavaScript is the Boss!'