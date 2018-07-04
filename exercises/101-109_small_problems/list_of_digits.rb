# list_of_digits.rb

# Write a method that takes one argument, a positive integer,
# and returns a list of digits in the number.

def digit_list(int)
  int.digits.reverse!
end

numbers = [123_45, 7, 375_290, 444]

numbers.each do |n|
  p digit_list(n)
end
