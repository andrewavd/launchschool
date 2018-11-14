# rotate_max.rb
# November 7, 2018
# 7kyu
# Completion time: 43:52

# Problem:
# Take a number: 56789. Rotate left, you get 67895.
# Keep the first digit in place and rotate left the other digits: 68957.
# Keep the first two digits in place and rotate the other ones: 68579.
# Keep the first three digits and rotate left the rest: 68597. Now it is over since keeping the first
# four it remains only one digit which rotated is itself.
# You have the following sequence of numbers:
# `56789 -> 67895 -> 68957 -> 68579 -> 68597'
# and you must return the greatest: `68957`.
# Calling this method `max_rot`
# `max_rot(56789) should return 68957`

def max_rot(num)
  max = num
  arr = num.to_s.chars

  (0..arr.size - 1).each do |i|
    tmp = arr[i]
    arr.delete_at(i)
    arr.push(tmp)
    max = arr.join.to_i if arr.join.to_i > max
  end
  max
end

p max_rot(56789) == 68957
p max_rot(38458215) == 85821534
