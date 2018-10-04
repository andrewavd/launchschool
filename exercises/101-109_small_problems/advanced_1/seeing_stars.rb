# seeing_stars.rb
# October 4, 2018

# Write a method that displays an 8-pointed star in an n x n grid, where n is an odd integer
# that is supplied as an argument to the method. The smallest such star you need to handle is
# a 7 x 7 grid.

def output_star(num, i)
  spaces = ((num - 3) / 2) - i
  puts ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(num)
end

def star(num)
  0.upto(num/2 - 1) { |i| output_star(num, i) }
  puts ('*' * num)
  (num/2 - 1).downto(0) { |i| output_star(num, i) }
end

star(7)
puts
star(9)
puts
star(15)
