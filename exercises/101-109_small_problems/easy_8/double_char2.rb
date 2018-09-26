# double_char.rb
# Write a method that takes a string, and returns a new string in which every consonant is doubled.
# Vowels (a, e, i, o, u), digits, punctuation, and whitespace should not be doubled.

CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]

def repeater(str)
  result = ''
  0.upto(str.size - 1) { |i| CONSONANTS.include?(str[i].downcase) ? result << str[i] * 2 : result << str[i] }
  result
end

p repeater('String')
p repeater('Hello-World!')
p repeater('July 4th')
p repeater('')
