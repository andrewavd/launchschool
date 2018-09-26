# rotation1.rb
# Write a method that rotates an array by moving the first element to the end of the array. The
# original array should not be modified.

def rotate_array_original(arr)
  results = arr.map { |e| e}
  results.push(results.shift)
end

def rotate_array(arr)
  results = arr.clone
  #results.push(results.shift)
  results << results.shift
end

def rotate_array_solution(arr)
  arr[1..-1] + arr[0]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integers(num)
  rotate_string(num.to_s)
end

p rotate_array([7, 3, 5, 2, 9, 1]) # == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c'])    # == ['b', 'c', 'a']
p rotate_array(['a'])              # == ['a']

x = [1, 2, 3, 4]
p rotate_array(x)
p x == [1, 2, 3, 4]

# Further exploration
p rotate_string('maris')
p rotate_integers(123456)