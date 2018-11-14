# data_reverse.rb
# November 9, 2018
# 6kyu
# Completion time: 0:00

# Problem:
# A stream of data is received and needs to be reversed.
# Each segment is 8 bits long, meaning the order of these segments needs to be reversed, for example:
# 11111111  00000000  00001111  10101010
# (byte1)   (byte2)   (byte3)   (byte4)
#should become:
# 10101010  00001111  00000000  11111111
# (byte4)   (byte3)   (byte2)   (byte1)
# The total number of bits will always be a multiple of 8.
# The data is given in an array as such:
# [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]

def data_reverse(data)
  result = []
  (0..data.size - 1).step(8) do |i|
    result.unshift(data[i, 8])
  end
  result.flatten
end

p data_reverse([1,1,1,1,1,1,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,1,1,1,1, 1,0,1,0,1,0,1,0]) == [1,0,1,0,1,0,1,0, 0,0,0,0,1,1,1,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1]
p data_reverse([0,0,1,1,0,1,1,0, 0,0,1,0,1,0,0,1]) == [0,0,1,0,1,0,0,1, 0,0,1,1,0,1,1,0]