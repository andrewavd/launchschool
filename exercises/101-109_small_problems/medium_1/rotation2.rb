# rotation2.rb
# Write a method that can rotate the last n digits of a number.

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  digits = num.to_s.chars
  (digits[0..-n - 1] + rotate_array(digits[-n..-1])).join.to_i
end

#p rotate_rightmost_digits(735291, 1) # == 735291
p rotate_rightmost_digits(735291, 2) # == 735219
p rotate_rightmost_digits(735291, 3) # == 735912
p rotate_rightmost_digits(735291, 4) # == 732915
p rotate_rightmost_digits(735291, 5) # == 752913
p rotate_rightmost_digits(735291, 6) # == 352917