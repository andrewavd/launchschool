# letter_counter2.rb
# Modify the word_sizes method from the previous exercise to exclude non-leters when determining word
# size. For instance, the length of "it's" should be 3, not 4.

def word_sizes(str)
  letter_count = Hash.new(0)
  str.split.each do |word|
    clean_word = word.gsub(/[^a-z]/i, '')
    # solution
    #clean_word = word.delete('^A-Za-z')
    letter_count[clean_word.size] += 1
  end
  letter_count
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') # == {}
