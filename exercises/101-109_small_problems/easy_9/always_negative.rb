# aleays_negative.rb
# Write a method that takes a number as an argument, If theargument is a positive number, return the degative of that numger, If the
# number is 0 or negative, return thre original number.

def negative(num)
  num > 0 ? num * -1 : num
end

p negative(5) # == -5
p negative(-3) # == -3
p negative(0) # == 0
