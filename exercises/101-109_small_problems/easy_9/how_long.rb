# how_long.rb
# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have
# appended a space and the word length.

def word_lengths(str)
  str.split.map { |word| word + " #{word.size.to_s}" }
end

p word_lengths("cow sheep chicken")
p word_lengths("baseball hot dogs and apple pie")
p word_lengths("It ain't easy, is it?")
p word_lengths("Supercalifragilisticexpialidocious")
p word_lengths("")