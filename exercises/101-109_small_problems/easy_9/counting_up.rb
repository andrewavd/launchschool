# counting_up.rb
# Write a methid that takes an integr argument, and returns an Array of all integers, in sequence, between 1 and the argument.

def sequence(num)
  result = []
  1.upto(num) { |e| result << e }
  result
end

def sequence_solution(num)
  (1..num).to_a
end

p sequence(5)
p sequence(3)
p sequence(1)
