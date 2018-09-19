# letter_counter1.rb
# Write a method that takes a string with one or more space separated words and returns a hash that
# shows the number of words of different sizes.

def word_sizes(str)
  letter_count = {}
  arr = str.split
  arr.each do |word|
    if letter_count[word.size] == nil
      letter_count[word.size] = 1
    else
      letter_count[word.size] += 1
    end
  end
  letter_count
end

def word_sizes_solution(str)
  letter_count = Hash.new(0)
  str.split.each { |word| letter_count[word.size] += 1 }
  letter_count
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') # == {}