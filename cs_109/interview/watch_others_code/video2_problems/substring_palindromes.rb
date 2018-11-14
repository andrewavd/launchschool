# substring_palindromes.rb
# October 29, 2018

def substring(str)
  result = []
  (1..str.size - 1).each { |i| result << str[0..i] }
  result
end

def substrings(str)
  result = []
  (0..str.size - 2).each { |i| result << substring(str[i..-1])}
  result.flatten
end

def palindromes(str)
  palindrome_candidates = substrings(str)
  palindrome_candidates.select { |word| word == word.reverse}
end

p palindromes("band") == []
p palindromes("world") == []
p palindromes("ppop") == ['pp', 'pop']