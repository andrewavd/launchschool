# halvsies.rb
# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half
# and second half of the original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.


def halvsies(arr)
  half = (arr.length / 2.0).round
  split_arr = [[], []]
  arr.each_with_index do |e, i|
    i + 1 <= half ? split_arr[0] << e : split_arr[1] << e
  end
  split_arr
end

p halvsies([1, 2, 3, 4]) # == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # == [[1, 5, 2], [4, 3]]
p halvsies([5]) # == [[5], []]
p halvsies([]) # == [[], []]