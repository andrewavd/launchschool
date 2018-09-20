# cute_angles.rb
# Write a method that takes a floating point number that represents an angle btween 0 and 360 degrees
# and returns a String that represents that angle in degrees, minutes and seconds. You should use a
# degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote
# (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Conversion:
# degrees = whole number
# minutes = whole number of (decimal * 60)
# seconds = decimal remainder of minutes * 60

DEGREE = "\xC2\xB0"

def dms(float_num)
  degrees = float_num.to_i
  degrees_remain = float_num - degrees
  minutes = (degrees_remain * 60).to_i
  minutes_remain = (degrees_remain * 60 - minutes)
  seconds = (minutes_remain * 60).to_i
  format(%(#{degrees.to_s}#{DEGREE}%02d'%02d"), minutes.to_s, seconds.to_s)
end

puts dms(30) # == %(30°00'00")
puts dms(76.73) # == %(76°43'48")
puts dms(254.6) # == %(254°36'00")
puts dms(93.034773) # == %(93°02'05")
puts dms(0) # == %(0°00'00")
puts dms(360) # == %(360°00'00") || dms(360) == %(0°00'00")