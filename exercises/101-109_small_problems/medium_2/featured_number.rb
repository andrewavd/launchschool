# featured_number.rb
# October 2, 2018

# A featured number (something unique to this exercise):
#		* An odd number.
#		* Is a muliple of 7.
#		* Digits occur exaxtly once each.

#	Examples:
#	49 is a featured number. (Odd, multiple of 7, and each digit is unique.)
#	98 is not a featured number. (Not odd).
#	97 is not (Not a multiple of 7).
#	133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than
# the argument. Issue an error message if there is no next featured number.

MSG = "HELL NO! I may only be a machine but I have a life too!"

def featured(num)
	return "'#{num}', #{MSG}" if num > 999_999_987
	num.even? ? num += 1 : num += 2
	num += 2 until num % 7 == 0
	num += 14 until num.to_s.chars.uniq.join.to_i == num
	num
end

p featured(12)          # == 21
p featured(20)          # == 21
p featured(21)          # == 35
p featured(997)         # == 1029
p featured(1029)        # == 1043
p featured(999_999)     # == 1_023_547
p featured(999_999_987) # == 1_023_456_987
p featured(9_999_999_999) # == 'There is no possible number that fulfills those requirements'