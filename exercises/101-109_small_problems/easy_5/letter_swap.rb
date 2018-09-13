# letter_swap.rb
# Given a string of words separared by spaces, write a method that takes this string
# of words and returns a string in which the first and last leters of every word is 
# swapped.

require 'pry'

def swap(str)
  words = str.split(' ')
  result = words.map! do |word|
    # first = word[0]
    # last = word[-1]
    # word[0] = last
    # word[-1] = first
    word[0], word[-1] = word[-1], word[0]
    word
  end
  result.join(' ')
end

puts "#{swap('Oh what a wonderful day it is')} ==> 'hO thaw a londerfuw yad ti si'"
puts "#{swap('Abcde')} ==> 'ebcdA'"
puts "#{swap('a')} ==> 'a'"
puts "#{swap('What do you think you are so big')} ==> 'thaW od uoy khint uoy era os gib'"