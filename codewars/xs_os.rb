# xs_os.rb
# November 8, 2018
# 7kyu
# Completion time: 4:39

# Problem:
# Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and
# be case insensitive. The string can contain any char.

# when no 'x' and 'o' is present should return true
# Examples:
# XO("ooxx") == true
# XO("xooxx") == false
# XO("ooxXm") == true
# XO("zpzpzpp") == true
# XO("zzoo") == false

def XO(str)
  str.downcase.count('x') == str.downcase.count('o')
end

p XO("ooxx") == true
p XO("xooxx") == false
p XO("ooxXm") == true
p XO("zpzpzpp") == true
p XO("zzoo") == false