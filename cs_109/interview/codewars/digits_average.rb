# digits_average.rb
# November 9, 2018
# 7kyu
# Completion time: 28:07

# Problem:
# Given an integer, take the (mean) average of each pair of consecutive digits. Repeat this process
# until you have a single integer, then return that integer.

# Example:
# digitsAverage(246)
# Average of 2 and 4 is 3, average of 4 and 6 is 5
# So, after first iteration 246 => 35
# Average of 3 and 5 is 4
# So digitsAverage(246) returns 4

# If the average of two digits is not an integer, round the result up.
# digitsAverage(89)
# Average of 8 and 9 is 8.5 ==> return 9

def digits_average(n)
  result = []
  arr = n.to_s.chars
  loop do
    (0..arr.size - 2).each do |i|
      p result << ((arr[i].to_i + arr[i+1].to_i) / 2.0).ceil
    end
    break if result.size == 1
    arr = result
    result = []
  end
  result[0]
end

p digits_average(246) == 4
p digits_average(89) == 9