# Write a method that takes one argument, a string,
# and returns the same string with the words in reverse order.

def reverse_sentence(sentence)
  sentence_arr = sentence.split.reverse!
  sentence_arr.join(' ')
  # sentence.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
