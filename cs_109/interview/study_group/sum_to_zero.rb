# Write a method that takes an array of numbers.
# If a pair of numbers in the array sums to zero, return the positions of those two numbers.
# You can assume that only one pair in the array will sum to zero.
# If no pair of numbers sums to zero, return `nil`.

def two_sum(arr)
  result = []
  (arr.size - 1).times do |i|
    (i + 1..arr.size - 1).each do |i2|
      result << i << i2 if arr[i] + arr[i2] == 0
    end
  end
  result.empty? ? nil : result
end

p two_sum([1, 3, 5, -3]) #== [1, 3]
#p two_sum([1, 3, 5]) == nil
#p two_sum([1, 3, 5, 10, 15, -8, 1404, 0, -4, -1404]) == [6, 9]
#p two_sum([1, 0, 0, 3, 5]) == [1, 2]


# Input: array of integers
# Output: array, (the indexes of the two numbers), or nil

=begin
Breakdown:
- Write a method that takes an array of numbers: Example -  [1, 3, 5, -3]
- If a pair of any of the array elements sums to 0, return the indexes of the elements that make up 
    that pair: arr = [1, 3, 5, -3] Elements 3 & -3 sum to 0, so the indexes 1 & 3 would be returned
    in an array like so: [1, 3].
- if no pairs sum to 0, return the value `nil`. NOT as part of a collection.
- There will be a MAXIMUM of 1 unique pair in the array that sums to 0. There could be no pairs that
    sum to 0.

Input: array of integers
Output: array containing two integers, the indexes of the selected elements || `nil`

Algorithm:
- Write a method that takes an array.
- (iteration #1) iterate through array beginning at element[0] through array[-2]
- (iteration #2) iterate through array beginning at element[iteration#1 current index + 1].
- sum the current element from iteration #1 and the current element from iteration #2.
    - if that sum == 0, capture to a new array, current index from iteration #1 and current index
        from iteration #2.
- Upon completion of both iterations, if `capture array` is empty, return `nil, otherwise return the
    `capture array`.

Tests:
[1, -1, 5, 0]
[1, 0, 2, -1]
=end