# Write a method that returns true if the string passed as an argument is a palindrome,
# false otherwise. A palindrome reads the same forward and backward. For this exercise,
# case matters as does punctuation and spaces.

def reverse(str)
  str_arr = str.chars
  rev_str = ""
  loop do
    rev_str << str_arr.pop
    break if str_arr.size == 0
  end
  rev_str
end

def palindrome?(str)
  # brute force
  str == reverse(str)
  # String#reverse
  # str == str.reverse
end

p palindrome?('madam')          # == true
p palindrome?('Madam')          # == false
p palindrome?("madam i'm adam") # == false
p palindrome?('356653')         # == true
