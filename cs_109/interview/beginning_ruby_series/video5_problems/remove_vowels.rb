# remove_vowels.#!/usr/bin/env ruby -wKU
# October 27, 2018

def remove_vowels(arr_strs)
  arr_strs.map { |word| word.delete "aeiou" }
end

p remove_vowels(['green', 'yellow', 'black', 'white'])
