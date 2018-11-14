# longest_palindrome.rb
# October 23, 2018

# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's `slice(start_index, length)` method,
# which returns a substring of length `length` starting at index
# `start_index`:
#
#     "abcd".slice(1, 2) == "bc"
#     "abcd".slice(1, 3) == "bcd"
#     "abcd".slice(2, 1) == "c"
#     "abcd".slice(2, 2) == "cd"
#
# Difficulty: hard.

# breakdown
# input: string return: string
# create all the sub-strings. Done this previously.
# check all the sub-strings to see which are palindromes.
# compute the length of the palindorme and store the palindorme if it is the longest.
# return the longest palindrome.

def each_char_substrings(string)
  result = []
  subs = ''
  string.each_char do |char|
    subs += char
    result << subs
  end
  result
end

def all_substrings(string)
  results = []
  0.upto(string.size - 1) do |i|
    results << each_char_substrings(string[i..string.size - 1])
  end
  results.flatten
end

def find_palindromes(arr)
  arr.select { |word| word == word.reverse }
end

def longest_palindrome(string)
  long = 0
  result = ''
  strings_arr = all_substrings(string)
  palindrome_list = find_palindromes(strings_arr)
  palindrome_list.each do |str|
    if str.size > long
      result = str
      long = str.size
    end
  end
  result
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #longest_palindrome")
puts("===============================================")
    puts(
      'longest_palindrome("abcbd") == "bcb": ' +
      (longest_palindrome('abcbd') == 'bcb').to_s
    )
    puts(
      'longest_palindrome("abba") == "abba": ' +
      (longest_palindrome('abba') == 'abba').to_s
    )
    puts(
      'longest_palindrome("abcbdeffe") == "effe": ' +
      (longest_palindrome('abcbdeffe') == 'effe').to_s
    )
puts("===============================================")