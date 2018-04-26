# April 25, 2018
# Use the select method to extract all odd numbers into a new array.


arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd_nums = arr.select { |x| x%2 != 0 }

puts "Original array: #{arr}"
puts "Odd number array: #{odd_nums}"
