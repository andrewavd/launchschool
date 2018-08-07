# Odd numbers

# Print all odd numbers from 1 to 99, inclusive. All numbers should be
# printed on seperate lines.

# Further exploration
# Repeat this exercise with a technique different from the one you just used.

(1..99).step(2) do |odd_num|
  puts odd_num
end

for num in 1..99
  puts num if num.odd?
end