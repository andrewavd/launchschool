# string_num.rb
# the String#to_i method converts a string of numeric characters (including an optional plus or
# minus sign) to an integer. String#to_i and the Integer constructor ( Integer() ) behave similarly.
# In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer.
# You may not use any of the methods mentioned above.

# Further Exploration: Write a hexadecimal_to_integer method that converts a string representing a
# hexadecimal number to its integer value.

DIGITS = [*'0'..'9'].zip(0..9).to_h
HEX_DIGITS = [*'0'..'9', *'A'..'F'].zip(0..15).to_h

=begin
DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

HEX_DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}
=end

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  int_value = 0
  digits.each { |val| int_value = 10 * int_value + val }
  int_value
end

# No hash needed
def string_to_integer2(string)
  string.chars.inject(0) { |sum, char| sum = sum * 10 + ('1'..char).count }
end

def hexadecimal_to_integer(string)
  digits = string.upcase.chars.map { |char| HEX_DIGITS[char] }
  int_value = 0
  digits.each { |val| int_value = 16 * int_value + val }
  int_value
end

p string_to_integer('4321') # ==> 4321
p string_to_integer('570')  # ==> 570

p string_to_integer2('4321') # ==> 4321
p string_to_integer2('570')  # ==> 570

p hexadecimal_to_integer('4D9f') # ==> 19871