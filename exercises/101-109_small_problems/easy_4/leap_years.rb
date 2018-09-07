# leap_years.rb
# Gregorian leap year:
# Leap Year = true if year divisible by 4, UNLESS that year is also divisible by 100.
# Leap Year = true if year divisible by 100, NOT a leap year UNLESS that year is divisible by 400.

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

# Further exploration
# The order in which you perform tets for a leap year calculation is important. For what years
# will leap_year? fail if you re-write it as:
=begin
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end
=end
# Answer: Years in which 100 and 400 are a common denominator. The reason is that 100 will be checked
# and rerurn a false but if that year is divisible by 400 it is actually a leap year and that will
# never be checked because the 100 conditional has already been met and a value returned.

# Can you rewrite leap_year? to perform its tests in the opposite order of the above solution?
# That is, test whether the year is divisible by 4 forst, then, if necessary, test whether it is
# divisible by 100, and finally, if necessary, test whether it is divisible by 400. Is the solution
# simpler or more complex than the original solution?

=begin
def leap_year?(year)
  leap_flag = false
  leap_flag = true if year % 4 == 0
  if leap_flag
    leap_flag = false if year % 100 == 0
  end
  if !leap_flag
    leap_flag = true if year % 400 == 0
  end
  leap_flag
end
=end

p leap_year?(2016)   # == true
p leap_year?(2015)   # == false
p leap_year?(2100)   # == false
p leap_year?(2400)   # == true
p leap_year?(240000) # == true
p leap_year?(240001) # == false
p leap_year?(2000)   # == true
p leap_year?(1900)   # == false
p leap_year?(1752)   # == true
p leap_year?(1700)   # == false
p leap_year?(1)      # == false
p leap_year?(100)    # == false
p leap_year?(400)    # == true
