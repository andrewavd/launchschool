# find_primes.rb
# October 27, 2018

def is_prime?(num)
  return true if (2..3).include?(num)
  num % 2 == 0 || num % 3 == 0 ? false : true
end

def find_primes(num1, num2)
  (num1..num2).each { |num| print "#{num}, " if is_prime?(num) }
  puts
end

find_primes(3, 10)
find_primes(2, 20)
