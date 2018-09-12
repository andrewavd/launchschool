# num_string.rb
# Write a method that takes a positive integer or zero, and converts it to a string representation.

def integer_to_string(num)
  num.digits.reverse.join
end

p integer_to_string(4321) # == '4321'
p integer_to_string(0)    # == '0'
p integer_to_string(5000) # == '5000'