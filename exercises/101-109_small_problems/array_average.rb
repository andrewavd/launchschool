# Array Average

#Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array. The array will
# never be empty and the numbers will always be positive integers.

def average(arr_ints)
  # use built-in methods
  arr_ints.sum / arr_ints.size

  # Further Exploration
  #(arr_ints.sum / arr_ints.size).to_f

  # iterate through array
=begin
  avg = 0
  arr_ints.each do |x|
    avg += x
  end
  avg / arr_ints.size
=end
end

# Results should output true.
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
