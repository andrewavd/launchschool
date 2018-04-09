require 'time'

# Calculate the number of hours in a year.

puts "There are 365 days in a year."
puts "There are 24 hours in a day."
yearly_hours = 24 * 365
puts "Based on the above, there are #{yearly_hours} hours in a year!"

# Calculate the number of minutes in a decade
puts " "
puts "There are 60 minutes in an hour."
puts "There are 24 hours in a day."
puts "There are 365 days in a year."
puts "There are 10 years in a decade."
decade_mins = 60 * 24 * 365 * 10
puts "Based on the above, there are #{decade_mins} minutes in a decade."

# Calculate my age (53) in seconds
# This calculation is based on age at the moment I turned 53,
# it is not calculated in "real time".
puts " "
puts "I am 53 years old."
# seconds * minutes * hours * days * years
age_seconds = 60 * 60 * 24 * 365 * 53
puts "If the above is true, I was #{age_seconds} seconds old the moment I turned 53 years old!"

puts " "
puts "I was born on October 27, 1964 at 10:02 am."
born = Time.new(1964, 10, 27, 10, 2, 0)
current = Time.new
age_seconds = (current - born).to_i
puts "I was approximately #{age_seconds} seconds old when this script was run!"

# Convert age in seconds to years
puts " "
puts "I am 1.16 billion seconds old."
seconds_2_years = 1160000000/365/24/60/60
puts "If the above is true, then I am #{seconds_2_years} years old!"
