# bubble_sort.rb
# October 2, 2018

# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort
# algorithm. Note, your sort will be 'in-place'; that is, you will mutate the Array passed as
# an argument. You may assume the Array contains at least 2 elements.

def bubble_sort!(arr)
  no_swaps = true
  loop do
    0.upto(arr.size - 2) do |i|
      if arr[i] > arr[i + 1]
        no_swaps = false
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
    end
    break if no_swaps
    no_swaps = true
  end
  arr
end

array = [5, 3]
p bubble_sort!(array) # ==> array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array) # ==> array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array) # ==> array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)