# fibonacci_location.rb

def find_fibonacci_index_by_length(num)
  index = 1
  power = 10 ** (num - 1)
  fibonacci_series = [1, 1]
  loop do
    current_fibonacci = fibonacci_series[index] + fibonacci_series[index - 1]
    break if fib >= power
    fibonacci_series << fib
    index += 1
  end
  index += 2
end

p find_fibonacci_index_by_length(2)     # == 7
p find_fibonacci_index_by_length(10)    # == 45
p find_fibonacci_index_by_length(100)   # == 476
p find_fibonacci_index_by_length(1000)  # == 4782
p find_fibonacci_index_by_length(10000) # == 47847