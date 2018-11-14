def create_multiples(target, factors)
  multiples = []
  factors.each do |factor|
    (factor..target - 1).step(factor) do |multiple|
      multiples << multiple if !multiples.include?(multiple)
    end
  end
  multiples
end

def sum_multiples(target, factors)
  factors = [3, 5] if factors.empty?
  sum = create_multiples(target, factors).inject(:+)
  sum == nil ? 0 : sum
end

p sum_multiples(20, [3, 5])
p sum_multiples(20, [])
p sum_multiples(20, [3])
p sum_multiples(20, [5])
p sum_multiples(5, [1, 2])
p sum_multiples(1, [2])