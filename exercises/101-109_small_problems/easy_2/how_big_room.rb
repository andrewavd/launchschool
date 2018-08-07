# How big is the room?

# Build a program that aska a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and feet.
# note: 1 square meter == 10.7639 square feet.

# Further exploration:
# Modify this program to ask for the input measurements in feet, and display the
# results in square feet, square inches, and square centimeters.

SQFEET_TO_SQMETERS = 0.092903
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

print "Enter the length of the room in feet: "
length = gets.chomp.to_f
print "Enter the width of the room in feet: "
width = gets.chomp.to_f
area_feet = (length * width).round(2)
area_meters = (area_feet * SQFEET_TO_SQMETERS).round(2)
area_inches = (area_feet * SQFEET_TO_SQINCHES).round(2)
area_centimeters = (area_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_feet} square feet."
puts "The area of the room is #{area_meters} square meters."
puts "The area of the room is #{area_inches} square inches."
puts "The area of the room is #{area_centimeters} square centimeters."
