# running_totals.rb
# Write a method that takes an Array of numbers, and returns an Array with the same number of
# elements, and each element has the running total from the original Array.

def running_total_first_try(arr)
  running_total = []
  return running_total if arr.empty?
  sum = 0
  arr.each do |n|
    sum += n
    running_total << sum
  end
  running_total
end

def running_total(arr)
  sum = 0
  arr.map { |n| sum += n }
end

# Further exploration: Try solving this problem using Array#each_with_object or Enumerable#inject
# (note that Enumerable methods can be applied to Arrays).

def running_total_each_with_object(arr)
  sum = 0
  arr.each_with_object([]) { |n, sum_arr| sum_arr << sum += n }
end

def running_total_inject(arr)
  sum = 0
  arr.inject([]) { |sum_arr, n| sum_arr << sum += n }
end

p running_total([2, 5, 13])          # == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) # == [14, 25, 32, 47, 67]
p running_total([3])                 # == [3]
p running_total([])                  # == []