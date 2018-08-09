# Counting the number of characters

# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be
# counted as a character.

def prompt(msg)
  print "==> #{msg}"
end

def how_many(words)
  words.delete(" ").length
end

prompt "Please write a word or multiple words: "
words = gets.chomp

puts "There are #{how_many(words)} characters in \"#{words}\"."
