# Write a method that counts down to zero using recursion.
def count_down(x)
  puts x
  count_down(x-1) if x > 0
end

puts count_down(10)