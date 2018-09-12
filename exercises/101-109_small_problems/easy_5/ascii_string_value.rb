# ascii_string_value.rb
# Write a method that determines and returns the ASCOO string value of a string that is passed in as
# an argument. The ASCOO string value is the sum of the ASCOO values of every character in the string.
# (You may use String#ord to determint the ASCII value of a character.)

def ascii_value(str)
  ascii_val = 0
  str.chars.each { |char| ascii_val += char.ord }
  ascii_val
end

p ascii_value('Four score') #== 984
p ascii_value('Launch School') #== 1251
p ascii_value('a') #== 97
p ascii_value('') #== 0