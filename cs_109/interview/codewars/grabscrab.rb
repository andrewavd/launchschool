# grabscrab.rb
# November 10, 2018
# 6kyu
# Completion time: 14:33

# Problem:
# Write a function that will accept a jumble of letters as well as a dictionary, and output a list of
# words that the pirate might have meant.

# Example:
# grabscrab("ortsp", ["sport", "parrot", "ports", "matey"]) == ["sport", "ports"]

def grabscrab(anagram, dictionary)
  dictionary.select { |w| w.chars.sort == anagram.chars.sort }
end

p grabscrab("ortsp", ["sport", "parrot", "ports", "matey"]) == ["sport", "ports"]