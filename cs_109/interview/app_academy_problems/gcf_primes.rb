# gcf_primes.#!/usr/bin/env ruby -wKU
# Octobr 24, 2018

# gcf.rb
# October 23, 2018

# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.

def is_prime?(number)
  return true if number == 2 || number == 3
  return false if number.even? || number % 3 == 0
  true
end

def find_prime_factors(num)
  factors = []
  prime_factors = []
  factors << num
  until factors.empty?
    factor = factors.shift
    if factor % 2 == 0
      prime_factors << 2
      if is_prime?(factor / 2)
        prime_factors << (factor / 2)
      else
        factors << (factor / 2)
      end
    else
      prime_factors << 3
      if is_prime?(factor / 3)
        prime_factors << (factor / 3)
      else
        factors << (factor / 3)
      end
    end
  end
  prime_factors
end

def gcf(number1, number2)
  if number1 < number2
    lo = number1
    hi = number2
  else
    lo = number2
    hi = number1
  end

  return lo if hi % lo == 0
  return 1 if is_prime?(lo) && is_prime?(hi)

  p lo_factors = find_prime_factors(lo).sort
  p hi_factors = find_prime_factors(hi).sort
  p (lo_factors & hi_factors)


end

p gcf(16, 24)
p gcf(12, 21)

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

=begin
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
      (gcf(18, 42) == 6).to_s
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
=end
