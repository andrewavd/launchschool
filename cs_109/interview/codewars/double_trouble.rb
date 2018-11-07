# double_trouble.rb
# November 6, 2018
# 7kyu
# Completion time: 9:09

# Problem:
# Given an array of integers (x), and a target (t), you must find out if any two consecutive numbers in
# the array sum to t. If so, remove the second number.

# Example:

# x = [1, 2, 3, 4, 5]
# t = 3 

# 1+2 = t, so remove 2. No other pairs = t, so rest of array remains: [1, 3, 4, 5]

# Work through the array from left to right.

# Return the resulting array.

def trouble(arr, t)
  i = 0
  loop do
    arr[i] + arr[i + 1] == t ? arr.delete_at(i + 1) : i += 1
    break if i == arr.size - 1
    end
  arr
end

p trouble([1, 3, 5, 6, 7, 4, 3],7) == [1, 3, 5, 6, 7, 4]
p trouble([4, 1, 1, 1, 4],2) == [4, 1, 4]
p trouble([2, 2, 2, 2, 2, 2], 4) == [2]
p trouble([2, 6, 2], 8) == [2, 2]