# diamonds.rb
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is
# supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def output_solid(num, i)
  # un-comment following print and remove .center(num) on line #8 if not using String#center
  # print ' ' * ((num / 2) - i)
  puts ('*' * (i*2 + 1)).center(num)
end

def output_hollow(num, i)
  if i == 0
    puts '*'.center(num)
  else
    puts ('*' + ' ' * ((i*2 + 1) - 2) + '*').center(num)
  end
end

def diamond(num)
  # solid diamond
  (0).upto(num/2) { |i| output_solid(num, i) }
  (num/2 - 1).downto(0) { |i| output_solid(num, i) }

  # hollow diamond
  (0).upto(num/2) { |i| output_hollow(num, i) }
  (num/2 - 1).downto(0) { |i| output_hollow(num, i) }
end

diamond(1)
diamond(3)
diamond(9)