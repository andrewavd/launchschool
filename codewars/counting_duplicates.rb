# duplicate_count.rb
# November 5, 2018
# 6 kyu

# Problem:
# Write a method that will return the count of distinct case-insensitive alphabetic characters
# and numeric digits that occut more than once in the input string. The input string can be assumed
# to contain only alphabetic characters (both uppercase and lowercase) and numeric digits.

def duplicate_count(text)
  text = text.downcase
  result = 0
  hsh = {}
  text.each_char do |char|
    if hsh.has_key?(char)
      hsh[char] += 1
    else
      hsh[char] = 1
    end
  end
  hsh.each_value { |v| result += 1 if v > 1 }
  result
end

p duplicate_count('abcde') == 0
p duplicate_count('aabbcde') == 2
p duplicate_count('aabBcde') == 2
p duplicate_count('indivisibility') == 1
p duplicate_count('Indivisibilities') == 2
p duplicate_count('aA11') == 2
p duplicate_count('ABBA') == 2

# Using Array#count
# arr = text.downcase.chars
# arr.uniq.count { |n| arr.count(n) > 1 }