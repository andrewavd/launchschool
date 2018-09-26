# reverse_digits.rb
# Write a method that takes a positive integer a an argument and returns that number with its digits reversed.

def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) # == 54321
p reversed_number(12213) # == 31221
p reversed_number(456)   # == 654
p reversed_number(12000) # == 21
p reversed_number(1)     # == 1
