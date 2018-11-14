# divisible_by_seven.rb
# November 6, 2018
# 7kyu
# Completion time: 11:30

# Problem:
# A number `m` of the form 10x + y is divisible by 7 if and only if x - 2y is divisible by 7. In
# other words, subtract twice the last digit from the number formed by the remaining digits. Continue
# to do this until a number known to be divisible or not by 7 is obtained: you can stop when this 
# number has at most 2 digits because you are supposed to know if a number os at most 2 digits is
# divisible by 7 or not.

# The orginal number is divisible by 7 if and only if the last number obtained using this procedure
# is divisible by 7.

# Examples:
# m = 371 -> 37 - (2 * 1) = 35 Thus, 371 is divisible by 7 since 35 is divisible by 7.
# m = 1603 -> 160 - (2 * 3) = 154 -> 15 - (2 * 4) = 7 Thus, 1603 is divisible by 7.
# m = 372 -> 37 - (2 * 2) = 33 Thus, 372 is not divisible by 7/
# m = 477557101 -> 47755710 - (2 * 1) = 47755708 -> 4775570 - (2 * 8) = 4775554 -> ...

# Each process of: "division by 10 & subtraction" is a step.

# Write a method that that calclulates if `m` is divisible by 7 using rule of "divisibility by 7"
# outlined above. Return an array which contains the last number obtained by the divisibility by 7
# rule and the number of steps it took to reach that number.

def seven(m)
  steps = 0
  loop do
    break if m < 100
    m = (m / 10) - (2 * (m % 10))
    steps += 1
  end
  [m, steps]
end

p seven(0) == [0, 0]
p seven(371) == [35, 1]
p seven(1603) == [7, 2]
p seven(477557101) == [28, 7]