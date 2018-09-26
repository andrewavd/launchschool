# sequence_count.rb
# Create a method that takes two integers as arguments. The first argument is a count, and the second
# is the first number of a sequence that your method will create. The method should return an Array
# that contains the same numbr of elements as the count argument, while the values of each element
# will be multiples of the starting number.

def sequence(num1, num2)
  result = []
  seq = num2
  num1.times do
    result << seq
    seq += num2
  end
  result
end

def sequence_solution(count, first)
  (1..count).map { |i| i * first }
end

p sequence(5, 1) # == [1, 2, 3, 4, 5]
p sequence(4, -7) # == [-7, -14, -21, -28]
p sequence(3, 0) # == [0, 0, 0]
p sequence(0, 1000000) # == []
