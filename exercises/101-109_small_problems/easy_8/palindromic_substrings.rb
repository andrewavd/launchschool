# palindromic_substrings.rb
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same
# sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear
# in the string. Duplicate palindromes should be included multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.
# For the purposes of this ecercise, you should consider all characters and pay attention to case; tha is, "AbcbA" is a palindrome, but
# neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def palindrome?(substring)
  substring.size > 1 && substring.downcase == substring.downcase.reverse
end

def substrings_at_start(str)
  result = []
  substring = ''
  str.chars.each do |char|
    substring += char if ('a'..'z').include?(char.downcase)
    result << substring if ('a'..'z').include?(char.downcase) && palindrome?(substring)
  end
  result
end

def palindromes(str)
  result = []
  0.upto(str.size) do |index|
    substring = substrings_at_start(str[index..str.size])
    result << substring
  end
  result.flatten
end

p palindromes('abcbA')
p palindromes('abcd')  # == []
p palindromes('madam') # == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')