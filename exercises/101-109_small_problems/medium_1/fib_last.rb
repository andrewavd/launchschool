# fib_last.rb
# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

=begin
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
=end

# Further exploration
def fibonacci(nth)
	result = 0
	last1 = 1
	last2 = 1
	if nth <= 2
		return 1
	else
		nth = nth % 1_000_000 if nth > 1_000_000
		3.upto(nth) do |x|
			result = last1.to_s[-1].to_i + last2.to_s[-1].to_i
			last2 = last1
			last1 = result.to_s[-1].to_i
		end
	end
	result.to_s[-1].to_i
end

def fibonacci_last(nth)
  fibonacci(nth)#.to_s[-1].to_i
end

p fibonacci_last(15)        # == 0 610
p fibonacci_last(20)        # == 5
p fibonacci_last(100)       # == 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # == 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # == 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # == 4