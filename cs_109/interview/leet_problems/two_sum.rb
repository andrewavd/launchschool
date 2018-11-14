# two_sum.rb
# November 1, 2018

def two_sum(arr, target)
  result = []
  (arr.size - 1).times do |i|
    (i + 1..arr.size - 1).each do |idx|
      result << i << idx if arr[i] + arr[idx] == target
    end
  end 
  result       
end

p two_sum([2, 7, 11, 15], 9)
p two_sum([2, 7, 11, 15], 26)