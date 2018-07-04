# list_of_digits.rb

# Write a method that takes one argument, a positive integer,
# and returns a list of digits in the number.

def digit_list(int)
  int.digits.reverse!
end

numbers = [12345, 7, 375290, 444]

numbers.each do |n|
  p digit_list(n)
end
