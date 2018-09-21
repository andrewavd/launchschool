# combine_lists.rb
# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains
# all elements from both Array arguments, with the elements taken in alternation.

def interleave_my_solution(arr1, arr2)
  new_arr = []
  index = 0
  arr1.length.times do
    new_arr << arr1[index] << arr2[index]
    index += 1
  end
  new_arr
end

def interleave_solution(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |e, i|
    new_arr << e << arr2[i]
  end
  new_arr
end

# Further Exploration
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # == [1, 'a', 2, 'b', 3, 'c']