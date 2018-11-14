# ascending_sequences.rb
# November 6, 2018
# 7kyu
# Completion time: 9:09

# Problem:
# [6]
# [1,6]
# [2,6]
# [3,6]
# [1,2,6]
# [1,3,6]
=begin
def make_sequences(n)
  arr = [n]
  count = 1
  arr.each do |idx|
    half = idx / 2
    (1..half).each do |i|
      arr << i
      count += 1
    end
    p arr = arr1
  end
  count
end
=end
def make_sequences(n)
  dp=[1,1]
  i=2
  while i<=n
    if (i%2==0)
      dp << (dp[i-1]+dp[i/2])
    else
      dp << dp[i-1]
    end
    i+=1
  end
  dp[n]
end

p make_sequences(6) == 6
p make_sequences(10) == 14
p make_sequences(1000) == 1981471878