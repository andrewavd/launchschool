# Sum of Digits

# Write a method that takes one argument, a positive integer,
# and returns the sum of its digits.

def sum(int_num)
  # Use methods
  #int_num.digits.sum

  # Iteration
  sum_digits = 0
  int_num.to_s.chars.each do |x|
    sum_digits += x.to_i
  end
  sum_digits
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
