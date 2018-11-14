# vowels_back.rb
# November 10, 2018
# 6kyu
# Completion time: 0:00

# Problem:
# Move consonants forward 9 places through the alphabet. If they pass 'z', start again at 'a'.
# Move vowels back 5 places thru the alphabet. If they pass 'a', start again at 'z'.

# Exceptions:

# If the character is 'c' or 'o', move it back 1 place. For 'd' move it back 3, and for 'e',
# move it back 4.

# If a moved letter becomes 'c', 'o', 'd' or 'e', rever it back to it's original value.

# The provided string will always be lower case, won't be empty and will have no specia; characters.

def vowels_back(st)
  st.each_char do |c|
    case c
    when 'c' || 'o'
      puts "c"
    else
      puts "not c or o"
    end
  end
end

vowels_back('coa')
#p vowels_back("testcase") == "tabtbvba"