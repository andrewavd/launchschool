# string_num_sign.rb
# Write a method that takes a String of digits, and returns the appropriate number as an integer.
# The String may have a leading + or - sign; if the first character is a +, your method should return
# a positive number; if it is a -, your method should return a negative number. If no sign is given,
# you should return a positive number.

DIGITS =  ('0'..'9').zip((0..9)).to_h

def string_to_integer(str)
  value = 0
  str.chars.each { |char| value = 10 * value + DIGITS[char] }
  value
end

def string_to_signed_integer1(str)
  case str[0]
  when '-' then -1 * string_to_integer(str.delete('-'))
  when '+' then string_to_integer(str.delete('+'))
  else
    string_to_integer(str)
  end
end

# Further Exploration: In our solution, we call string[1..-1] twice, and call string_to_integer
# three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls
# once each.

# This is a situation where I don't believe refactoring is necessarilly berneficial.

def string_to_signed_integer(str)
  unsigned_str = str.start_with?('-', '+') ? str[1..-1] : str
  num_value = string_to_integer(unsigned_str)
  str[0] == '-' ? -num_value : num_value
end

p string_to_signed_integer('4321') # ==> 4321
p string_to_signed_integer('-570') # ==> -570
p string_to_signed_integer('+100') # ==> 100