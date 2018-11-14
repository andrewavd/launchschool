# gcf.rb
# October 23, 2018

# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.

def gcf(number1, number2)
  if number1 < number2
    lo = number1
    low = number1
    hi = number2
  else
    lo = number2
    low = number2
    hi = number1
  end

  loop do
    break if hi % lo == 0 && low % lo == 0
    lo -= 1
  end
  lo
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #greatest_commmon_factor")
puts("===============================================")
    puts(
      'greatest_common_factor(3, 9) == 3: ' +
      (gcf(3, 9) == 3).to_s
    )
    puts(
      'greatest_common_factor(16, 24) == 8: ' +
      (gcf(16, 24) == 8).to_s
    )
    puts(
      'greatest_common_factor(3, 5) == 1: ' +
      (gcf(3, 5) == 1).to_s
    )
    puts(
      'greatest_common_factor(21, 28) == 7: ' +
      (gcf(21, 28) == 7).to_s
    )
    puts(
      'greatest_common_factor(12, 20) == 4: ' +
      (gcf(12, 20) == 4).to_s
    )
    puts(
      'greatest_common_factor(18, 42) == 6: ' +
      (greatest_common_factor(18, 42) == 6).to_s
    )
    puts(
      'greatest_common_factor(20, 12) == 4: ' +
      (gcf(20, 12) == 4).to_s
    )
    puts(
      'greatest_common_factor(12, 14) == 2: ' +
      (gcf(12, 14) == 2).to_s
    )
    puts(
      'greatest_common_factor(6, 30) == 6: ' +
      (gcf(6, 30) == 6).to_s
    )
    puts(
      'greatest_common_factor(30, 24) == 6: ' +
      (gcf(30, 24) == 6).to_s
    )
    puts(
      'greatest_common_factor(30, 21) == 3: ' +
      (gcf(30, 21) == 3).to_s
    )
puts("===============================================")
