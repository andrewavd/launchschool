# num_string_sign.rb
# Write a method that takes an integer, and converts it to a string representation.

def signed_integer_to_string(num)
  str = num.abs.digits.reverse.join
  if num < 0
    '-' + str
  elsif num > 0
    '+' + str
  else
    str
  end
end

p signed_integer_to_string(4321) # == '+4321'
p signed_integer_to_string(-123) # == '-123'
p signed_integer_to_string(0)    # == '0'