# frequency_sequence.rb
# November 7, 2018
# 7kyu
# Completion time: 10:56

# Problem:
# Return an output string that translates an input string s/$s by replacing each character in "s/$s" 
# with a number representing the number of times that character occurs in s/$s and separating each 
# number with the character(s) "sep/$sep".

# Examples:
# freq_seq("hello world", "-") == "1-1-3-3-2-1-1-2-1-3-1"
# freq_seq("19999999", ":") == "1:7:7:7:7:7:7:7"
# freq_seq("^^^**$", "x") == "3x3x3x2x2x1"

def freq_seq(str, seq)
  # original:
  # result = str.chars.map { |char| str.count(char).to_s }.join(seq)
  
  # re-factored:
  str.chars.map { |char| str.count(char) }.join(seq)
end

p freq_seq("hello world", "-") == "1-1-3-3-2-1-1-2-1-3-1"
p freq_seq("19999999", ":") == "1:7:7:7:7:7:7:7"
p freq_seq("^^^**$", "x") == "3x3x3x2x2x1"