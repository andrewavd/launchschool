# study group live session October 26, 2018

# Write a function to_weird_case (weirdcase in Ruby) that accepts a string, and returns the same string
# with every 4th character in a word upcase. Other characters should remain the same.

# input str, output:same str

# input: string
# output:string

=begin
step by step breakdown/rules:
  - Write a method that takes 1 string argument and returns a string based on the string argument.
  - Upcase every 4th character in each word of the string argument.
  - Other characters should remain unchanged.
=end

# Questions/assumptions:
# - words are sperated by single spaces.

# algorithm:
# 1) obtain each word in the string. words_arr = str.split(' ')
# 2) iterate through words_arr so each word can be processed. words_arr.each do |word| ...
# 3) iterate thorough the characters of each word. word.each_char do |char|
# 4 if char is the 4th, 8th, etc, character of the word, .upcase it.
# return processed array as a string. str_arr.join(' ')

=begin
# sandbox:
  - word = 'plutonium' length = 9
  - position - letter - index
  - 1 - p - 0
  - 2 - l - 1
  - 3 - u - 2
  - 4 - t - 3
  - 5 - o - 4
  - 6 - n - 5
  - 7 - i - 6
  - 8 - u - 7
  - 9 - m - 8
=end

def to_weird_case_live(str)
  words_arr = str.split(' ')
  words_arr.each do |word|
    word.each_char.with_index do |char, i|
      #char.upcase if (i) % 3 == 0 (This works for the first case but not the following case(s): i == 7 )
      #char.upcase! if (i + 1) % 4 == 0 (Doesn't appear individual characters can be mutated and thus mutate the string.)
      word[i] = char.upcase if (i + 1) % 4 == 0
    end
    #word[3] = word[3].upcase if word[3] != nil (My original attempt.)
  end
  words_arr.join(' ')
end

# Following is what I came up with after session:
def to_weird_case(str)
  #str.split.each { |word| word.each_char.with_index { |char, i| word[i] = char.upcase if (i + 1) % 4 == 0 } }.join(' ')
  str.split.each { |word| (3..word.size - 1).step(4) { |i| word[i] = word[i].upcase if word[i] != nil } }.join(' ')
end

p to_weird_case('AndyHolmes') == 'AndYHolMes'
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious') == 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'
