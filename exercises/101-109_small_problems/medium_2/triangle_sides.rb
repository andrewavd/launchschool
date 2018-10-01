# triangle_sides.rb
# October 1, 2018

# A triangle is classified as follows:
#  * equilateral - All 3 sides ar of equal length
#  * isosceles - 2 sides are of equal length, while the 3rd is different
#  * scalene - All 3 sides are of different length

# To be a valid triangle:
# 1) All sides mst have lengths greater than 0.
# 2) The sum of the lengths of the two shortest sides must be greater than the length of
#    the longest side. and : If
# 3) Both of these conditions must be satisfied or the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments and returns
# a symbol, :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle
# is equilateral, isosceles, scalene, or invalid.

def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort
  return :invalid if triangle[0] == 0 || triangle[0] + triangle[1] <= triangle[2]
  return :equilateral if triangle[0] == triangle[1] && triangle[0] == triangle[2]
  return :isosceles if triangle[0] == triangle[1] || triangle[1] == triangle[2]
  :scalene
end

p triangle(3, 3, 3)   # == :equilateral
p triangle(3, 3, 1.5) # == :isosceles
p triangle(3, 4, 5)   # == :scalene
p triangle(0, 3, 3)   # == :invalid
p triangle(3, 1, 1)   # == :invalid