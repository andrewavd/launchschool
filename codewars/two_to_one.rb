# two_to_one.rb
# November 6, 2018
# 7kyu

# Problem:
# Take 2 strings `s1` and `s2` including only letters from `a` to `z`. Return a new sorted string, the
# longest possible, containing distinct letters.

# - each taken only once-coming from `s1` or `s2`.
#   Examples:
#     a = 'xyaabbbccccdefww' b = 'xxxxyyyyabklmopq' longest(a, b) => 'abcdefklmopqwxy'
#     a = 'abcdefghijklmnopqrstuvwxyz' longest(a, b) => 'abcdefhgijklmnopqrstuvwxyz'

def longest(str1 = '', str2 = '')
  (str1.chars + str2.chars).uniq.sort.join
end

p longest('xyaabbbccccdefww', 'xxxxyyyyabklmopq') == 'abcdefklmopqwxy'
p longest('abcdefghijklmnopqrstuvwxyz') == 'abcdefghijklmnopqrstuvwxyz'