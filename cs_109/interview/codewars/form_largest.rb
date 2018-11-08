# form_largest.rb
# November 8, 2018
# 7kyu
# Completion time: 11:56

# Problem:
# Given a number, Return The Maximum number could be formed from the digits of the number given.

# Example: As 321 is The Maximum number could be formed from the digits of the number 213.

def max_number(n)
  n.to_s.chars.sort.reverse.join.to_i
end

p max_number(213) == 321
p max_number(7389) == 9873
p max_number(63792) == 97632
p max_number(566797) == 977665
p max_number(1000000) == 1000000