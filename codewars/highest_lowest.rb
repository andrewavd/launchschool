# highest_lowest.rb
# November 8, 2018
# 7kyu
# Completion time: 17:44

# Problem:
# In this little assignment you are given a string of space separated numbers, and have to return the
# highest and lowest number.

# Examples:
# high_and_low("1 2 3 4 5")  == "5 1"
# high_and_low("1 2 -3 4 5") == "5 -3"
# high_and_low("1 9 3 4 -5") == "9 -5"

def high_and_low(str)
  result = []
  str = str.split(' ').map { |n| n.to_i }
  result << str.max
  result << str.min
  result.join(' ')
end

p high_and_low("1 2 3 4 5")  == "5 1"
p high_and_low("1 2 -3 4 5") == "5 -3"
p high_and_low("1 9 3 4 -5") == "9 -5"
p high_and_low("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6") == "542 -214"