# isograms.rb
# November 5, 2018

# Problem:
# An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a
# method that determines whether a string that contains only letters is an isogram. Assume the
# empty string is an isogram.

# Ignore case.

def is_isogram(string)
  return true if string.empty?
  string.downcase.chars.uniq == string.downcase.chars
end

p is_isogram('isogram') == true
p is_isogram('maris holmes') == false
p is_isogram("Dermatoglyphics" ) == true
p is_isogram("aba" ) == false
p is_isogram("moOse" ) == false