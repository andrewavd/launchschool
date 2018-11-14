# merge_sorted_lists.rb
# October 9, 2018

# Write a method that takes two sorted Arrays as arguments, and returns a new Array that 
# contains all elements from both arguments in sorted order.
# You may not provide any solution that requires you to sort the result array. You must build
# the result array one element at a time in the proper order. Your solution should not mutate
# the arrays.

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  merged = arr1.clone
  arr2.each do |e|
    if e > merged[-1]
      merged.push(e)
    else
      0.upto(merged[-1]) do |idx|
        if e <= merged[idx]
          merged.insert(idx, e)
          break
        end
      end
    end
  end
  merged
end

p merge([1, 5, 9], [2, 6, 8]) # ==> [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2])    # ==> [1, 1, 2, 2, 3]
p merge([], [1, 4, 5])        # ==> [1, 4, 5]
p merge([1, 4, 5], [])        # ==> [1, 4, 5]