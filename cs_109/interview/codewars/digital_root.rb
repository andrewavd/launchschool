# digital_root.rb
# November 13, 2018
# 6kyu
# Completion time: 7:55

# Problem:
=begin
A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has two digits, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

Here's how it works:

digital_root(16)
=> 1 + 6
=> 7

digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6

digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6

digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2
=end

def digital_root(n)
  until n < 10
    arr = n.to_s.chars
    arr = arr.map { |num| num.to_i }
    n = arr.sum
  end
  n
end

p digital_root(16) == 7
p digital_root(456) == 6