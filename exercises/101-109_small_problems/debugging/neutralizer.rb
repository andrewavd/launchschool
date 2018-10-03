# neutralizer.rb
# October 3, 2018

# We wrote a neutalize method that removes negative words from sentences. However, it fails
# to remove all of them.

# What exactly happens? Answer: In the original code we mutate (delete elements) the 'words'
# array as we iterate through it. Because two of the flagged words, "dull" and "boring" are
# consecutive in order, when dull is deleted, boring is re-positioned in the 'words' array to
# an index that the iteration process has already passed. This means it ("boring") is never
# checked for deletion.

# Solution: By cloning the 'words' array, we can test it and make changes to the clone so
# out test array remains un-corrupted.

def neutralize(sentence)
  words = sentence.split(' ')
  result = words.clone # added by me
  words.each do |word|
    #words.delete(word) if negative?(word)
    result.delete(word) if negative?(word)
  end

  #words.join(' ')
  result.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.