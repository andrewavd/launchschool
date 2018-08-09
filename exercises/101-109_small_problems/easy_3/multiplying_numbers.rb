# Multiplying two numbers

# Create a method that takes two arguments, multiplies them together, and
# returns the result.

# Further exploration
# For fun: what happens if the first argument is an array? What do you think
# is happening here?

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3)
p multiply([5, 6], 3)
puts multiply('hi', 3)
