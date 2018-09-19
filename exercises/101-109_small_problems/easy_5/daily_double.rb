# daily_double.rb
# Description: Write a method that takes a string argument and returns a new string that contains the
# value of the original string with all consecutive duplicate characters collapsed into a single
# character. You may not use String#squeeze or String#squeeze!.


# 1) Breakdown Problem:
# > Write a method
# >
# >
# >
# >

# 2) Input:
# > String
# >
# >

# 3) Output:
# > new string with consecutive duplicates condensed to a single character.
# >
# >

# 4) Questions:
# >
# >

def crunch(str)
  new_str = []
  str.chars.each_with_index { |char, i| new_str << char if char != str[i + 1] }
  new_str.join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''