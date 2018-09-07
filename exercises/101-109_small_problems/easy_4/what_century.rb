# what_century.rb
# Write a method that takes a year as input and returns the century. The return value should be
# a string that begins with the century number, and ends with st, nd, rd or th as appropriate for
# that number.
# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def num_suffix(century)
  return 'th' if century == 11 || century == 12 || century == 13

  case century % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else
    'th'
  end
end

def century(year)
  year % 100 == 0 ? century = year / 100 : century = year / 100 + 1
  century.to_s + num_suffix(century)
end

p century(2000)  # == '20th'
p century(2001)  # == '21st'
p century(1965)  # == '20th'
p century(256)   # == '3rd'
p century(5)     # == '1st'
p century(10103) # == '102nd'
p century(1052)  # == '11th'
p century(1127)  # == '12th'
p century(1225)  # == '13th'
p century(11201) # == '113th'