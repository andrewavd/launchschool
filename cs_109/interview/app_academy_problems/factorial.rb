# factorial.rb
# October 22, 2018

# Write a method that takes an integer `n` in; it should return
# n*(n-1)*(n-2)*...*2*1. Assume n >= 0.
#
# As a special case, `factorial(0) == 1`.
#
# Difficulty: easy.

def factorial(n)
  if n == 0 || n == 1
    factorial_result = 1
  else
    # Recursively calculating the factorial.
    # factorial_result = n * factorial(n - 1)

    # Brute force looping to calculate the factorial.
    factorial_result = 1
    while n > 1
      factorial_result *= n
      n -= 1
    end
  end
  factorial_result
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #factorial")
puts("===============================================")
    puts(
      'factorial(0) == 1: ' + (factorial(0) == 1).to_s
    )
    puts(
      'factorial(1) == 1: ' + (factorial(1) == 1).to_s
    )
    puts(
      'factorial(2) == 2: ' + (factorial(2) == 2).to_s
    )
    puts(
      'factorial(3) == 6: ' + (factorial(3) == 6).to_s
    )
    puts(
      'factorial(4) == 24: ' + (factorial(4) == 24).to_s
    )
puts("===============================================")