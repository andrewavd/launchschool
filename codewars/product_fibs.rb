# product_fibs.rb
# November 9, 2018
# 5kyu
# Completion time: 0:00

# Problem:
# 

def product_fib(n)
  fib = [0, 1]
  loop do
    if fib.inject(:*) < n
      fib << fib.sum
      fib.delete_at(0)
    elsif fib.inject(:*) == n    
      return [fib.first, fib.last, true]
    else
      return [fib.first, fib.last, false]
    end
  end
end

p product_fib(4895) == [55, 89, true]
p product_fib(5895) == [89, 144, false]