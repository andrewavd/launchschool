# Odd lists

# Write a method that returns an arraay that contains every other element of an
# array thay is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th and so on elements of the argument
# array.

# Further exploration
# Write a companion method that returns the 2nd, 4th, 6th and so on elements
# of an array.

def oddities(arr)
  ans = []
  arr.each_with_index do |num, i|
    if (i + 1).odd?
      ans << num
    end
  end
  ans
end

def evens(arr)
  ans = []
  arr.each_with_index do |num, i|
    if (i).odd?
      ans << num
    end
  end
  ans
end

p oddities([1, 2, 3, 4, 5])
p oddities([2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])
puts "-----"
p evens([1, 2, 3, 4, 5])
p evens([2, 3, 4, 5, 6])
p evens(['abc', 'def'])
p evens([123])
p evens([])