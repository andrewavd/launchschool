# reverse_every_other.rb
# November 9, 2018
# 6kyu
# Completion time: 9:57

# Problem:
# Reverse every other word in a given string, then return the string. Throw away any leading or 
# trailing whitespace, while ensuring there is exactly one space between each word. Punctuation marks
# should be treated as if they are a part of the word in this kata.

# Examples:
# reverse_alternate("Did it work?") == "Did ti work?"
# reverse_alternate("I really hope it works this time...") == "I yllaer hope ti works siht time..."
# reverse_alternate("Reverse this string, please!") == "Reverse siht string, !esaelp"
# reverse_alternate("Have a beer") == "Have a beer"
# reverse_alternate("") == ""

def reverse_alternate(str)
  result = []
  str = str.strip
  str_arr = str.split(' ')
  str_arr.each_with_index { |w, i| i.odd? ? result << w.reverse : result << w }
  result.join(' ')
end

def better_rev_alt(str)
  str.strip.split(' ').map.with_index { |w, i| i.odd? ? w.reverse : w }.join(' ')
end

p reverse_alternate("Did it work?") == "Did ti work?"
p reverse_alternate("I really hope it works this time...") == "I yllaer hope ti works siht time..."
p better_rev_alt("Reverse this string, please!") == "Reverse siht string, !esaelp"
p reverse_alternate("Have a beer") == "Have a beer"
p reverse_alternate("") == ""