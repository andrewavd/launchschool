# find_missing_letter.rb
# November 5, 2018
# 6 kyu

# Problem:
# Write a method that takes an array of consecutive (increasing) letters as input and that returns
# the missing letter in the array.

# You will always get a valid array and there will always be exactly one letter missing. The length of
# the array will always be at least two.

# The case of all letters will be the same.

def find_missing_letter(arr)
  (arr[0]..arr[-1]).each_with_index { |char, i| return char if char != arr[i] }
end

p find_missing_letter(['a','b','c','d','f']) == 'e'
p find_missing_letter(['O','Q','R','S']) == 'P'