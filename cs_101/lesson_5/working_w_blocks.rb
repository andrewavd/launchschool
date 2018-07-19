# Example 1
puts "Example 1"
[[1, 2], [3, 4]].each do |arr|
  puts "arr #{arr}"
  puts arr.first
end
# 1
# 3
# .each => [[1, 2], [3, 4]] 
puts

# Example 2
puts "Example 2"
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# .map => [nil, nil]
puts

# Example 3
puts "Example 3"
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# .map => [1, 3]
puts

# Example 4
puts "Example 4"
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# my_arr = [[18, 7], [3, 12]] because each returns the oblect (array)
# it was called on.
puts

# Example 5
puts "Example 5"
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]
puts

# Example 6
puts "Example 6"
[{ a: 'ant', b: 'elepannt' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
puts

# Example 7
puts "Example 7"
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
# By non destructively converting the sub-arrays to integers the outer array
# sorts the sub-arrays by (.sort_by) the more intuitive integer values.
puts

# Example 8
puts "Example 8"
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
puts

# Example 9
puts "Example 9"
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
puts

# Example 10
puts "Example 10"
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1  # it's an integer
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5]], [6, 7]]
