# what_century.rb
# October 17, 2018

# Step 1 - Problem write up.
# A) Original write up:
# Write a function that takes an integer year as input and returns the century. The return 
# value should be a string that begins with the century number, and ends with st, nd, rd, or
# th as appropriate for that number.
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th
# century.

# B) Breakdown:
# - Write a function that takes an integer as an argument.
# - Function returns a string representing the century derived from integer argument.
# - A century begins in year 01 and ends in 000. 1901-2000 == 20th century.
# - How do you mathmatically calculate a century? century = (Answer integer argument - 1) / 100 + 1
# - The return should be  a string that ends with the proper english parase:
#    i) st, nd, rd or th.
#    ii) Example: 1st, 2nd, 3rd, 4th.
#    iii) Exceptions: 11th, 12th, 13th
# - How do you identify which ending goes with which century? case century when 1, when (11..13), else

# C) Input/Output types and examples: (2 minimum)
# Input: integer  Output: 'string'
# Examples:
# Input: 1964 Output: '20th'
# Input: 2018 Output: '21st'

# Step 2 - Approach:
# Write a method, named "century", that takes an integer as an argument. Calculate the century the integer argument represents by using the following:
# (integer argument - 1) / 100 + 1. On the result of that calulation, perform % 100. That result can be the argument in a case statement to determine
# which prefix is appended to the century.
# 


# Step 3 - Test cases:
# century(1)     == '1st'
# century(100)   == '1st'
# century(101)   == '2nd'
# century(133)   == '2nd'
# century(245)   == '3rd'
# century(1052)  == '11th'
# century(1152)  == '12th'
# century(1252)  == '13th'
# century(2012)  == '21st'
# century(2112)  == '22nd'
# century(22222) == '223rd'

# Step 4 - Layout code (pseudo code)

# Step 5 - Let's code!

def century(year)
  century = (year - 1) / 100 + 1
  suffix_test = century % 100
  century = century.to_s
  if (11..13).include?(suffix_test)
    century << 'th'
  else
    suffix_test = suffix_test % 10
    case suffix_test
    when 1
      century << 'st'
    when 2
      century << 'nd'
    when 3
      century << 'rd'
    else
      century << 'th'
    end
  end
  century
end

p century(1)     == '1st'
p century(100)   == '1st'
p century(101)   == '2nd'
p century(133)   == '2nd'
p century(245)   == '3rd'
p century(1052)  == '11th'
p century(1152)  == '12th'
p century(1252)  == '13th'
p century(2012)  == '21st'
p century(2112)  == '22nd'
p century(22222) == '223rd'

# Step 6 - Test code:

# Step 7 - Refactor:

# Step 8 - Consider edge cases:

# Questions:
# 