# valley.rb
# November 7, 2018
# 7kyu
# Completion time: 23:55

# Problem:
# Input : an array of integers.
# Output : this array, but sorted in such a way that there are two wings:
# the left wing with numbers decreasing,
# the right wing with numbers increasing.
# the two wings have the same length. If the length of the array is odd the wings are around the bottom,
# if the length is even the bottom is considered to be part of the right wing.
# each integer l of the left wing must be greater or equal to its counterpart r in the right wing, the
# difference l - r being as small as possible. In other words the right wing must be nearly as steeply 
# as the left wing.

# Examples:
# Even:
# a = [79, 35, 54, 19, 35, 25]
# make_valley(a) --> [79, 35, 25, *19*, 35, 54]
# The bottom is 19, left wing is [79, 35, 25], right wing is [*19*, 35, 54].
# 79..................54
#    35..........35
#        25. 
#          ..19

# Odd:
# a = [67, 93, 100, -16, 65, 97, 92]
# make_valley(a) --> [100, 93, 67, *-16*, 65, 92, 97]
# The bottom is -16, left wing [100, 93, 67] and right wing [65, 92, 97] have same length.
# 100.........................97
#    93..........
#               .........92
#        67......
#               .....65
#            -16     

def make_valley(arr)
  left = []
  right = []
  arr = arr.sort.reverse
  (0..arr.size - 1).step(2) { |i| left << arr[i] }
  (1..arr.size - 1).step(2) { |i| right << arr[i] }
  pleft + right.reverse
end

a = [79, 35, 54, 19, 35, 25]
p make_valley(a) == [79, 35, 25, 19, 35, 54]

a = [67, 93, 100, -16, 65, 97, 92]
p make_valley(a) == [100, 93, 67, -16, 65, 92, 97]