# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result bh the number of
# entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array in non-empty.


def show_multiplicative_average(arr)
  product = 1.to_f
  arr.each { |e| product *= e }
  average = product / arr.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
