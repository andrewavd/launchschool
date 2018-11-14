# nearby_az.rb
# October 22, 2018

# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

def nearby_az(string)
  return false if string.count('a') == 0
  string.each_char.with_index do |char, idx|
    if char == 'a'
      return true if string.slice(idx + 1, 3).include?('z')
    end
  end
  false
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #nearby_az")
puts("===============================================")
    puts('nearby_az("baz") == true: ' + (nearby_az('baz') == true).to_s)
    puts('nearby_az("abz") == true: ' + (nearby_az('abz') == true).to_s)
    puts('nearby_az("abcz") == true: ' + (nearby_az('abcz') == true).to_s)
    puts('nearby_az("a") == false: ' + (nearby_az('a') == false).to_s)
    puts('nearby_az("z") == false: ' + (nearby_az('z') == false).to_s)
    puts('nearby_az("za") == false: ' + (nearby_az('za') == false).to_s)
    puts('nearby_az("andy azzarian") == true: ' + (nearby_az('andy azzarian') == true).to_s)
puts("===============================================")