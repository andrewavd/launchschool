# tri_angles.rb
# October 1, 2018

# A triangle is classified as follows:
# * right - One angle of the triangle is a right angle (90 degrees)
# * acute - All 3 angles of the triangle are less than 90 degrees
# * obtuse - One angle is greater than 90 degrees

# To be a valid triangle:
# 1) All 3 of the individual angles must be greater than 0.
# 2) The sum of the 3 angles must = 180 degrees.

# Write a method that takes the 3 angles of a triangle as arguments and reurns a symbol:
# :right, :acute:, :obtuse or :invalid, depending on whether the triangle is a right, acute
# obtuse or invalid triangle.

def triangle(angle1, angle2, angle3)
  triangle = [angle1, angle2, angle3].sort
  return :invalid if triangle[0] == 0 || triangle.sum != 180
  return :acute  if triangle.all? { |angle| angle < 90 }
  return :right if triangle.any? { |angle| angle == 90 }
  :obtuse
end

p triangle(60, 70, 50)  #== :acute
p triangle(30, 90, 60)  #== :right
p triangle(120, 50, 10) #== :obtuse
p triangle(0, 90, 90)   #== :invalid
p triangle(50, 50, 50)  #== :invalid