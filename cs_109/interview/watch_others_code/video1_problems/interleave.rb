# interleave.rb
# October 29, 2018

def interleave(arr1, arr2)
  result = []
  (0..arr1.size - 1).each { |i| result << arr1[i] << arr2[i] }
  result
end

# All outputs should be "true" if tests are passed.
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
