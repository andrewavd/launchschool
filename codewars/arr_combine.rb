# arr_combine.rb
# November 9, 2018
# 6kyu
# Completion time: 0:00

# Problem:

def arr_combine(arr1, arr2)
  arr1 - (arr1 - arr2)
end

p arr_combine([1, 2, 2, 3], [2, 2, 3]) == [2, 2, 3]
p arr_combine([1, 2, 2, 3, 4, 7], [2, 2, 3, 7, 9, 11, 13]) == [2, 2, 3, 7]
p arr_combine([1, 3, 3, 4, 5], [3, 3, 5, 7]) == [3, 3, 5]