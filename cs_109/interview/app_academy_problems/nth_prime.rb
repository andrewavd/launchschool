# nth_prime.rb
# October 23, 2018

# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.

def is_prime?(number)
  return true if number == 2 || number == 3
  return false if number.even? || number % 3 == 0
  true
end

def nth_prime(nth)
  prime = nil
  count = 0
  num = 2
  until count == nth
    if is_prime?(num)
      prime = num
      count += 1
    end
    num += 1
  end
  prime
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #nth_prime")
puts("===============================================")
    puts('nth_prime(1) == 2: ' + (nth_prime(1) == 2).to_s)
    puts('nth_prime(2) == 3: ' + (nth_prime(2) == 3).to_s)
    puts('nth_prime(3) == 5: ' + (nth_prime(3) == 5).to_s)
    puts('nth_prime(4) == 7: ' + (nth_prime(4) == 7).to_s)
    puts('nth_prime(5) == 11: ' + (nth_prime(5) == 11).to_s)
puts("===============================================")