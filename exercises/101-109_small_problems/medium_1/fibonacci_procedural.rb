# fibonacci_procedural.rb
# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(nth)
	result = 0
	last1 = 1
	last2 = 1
	if nth <= 2
		return 1
	else
		3.upto(nth) do |x|
			result = last1 + last2
			last2 = last1
			last1 = result
		end
	end
	result
end

p fibonacci(20)    # == 6765
p fibonacci(100)   # == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501