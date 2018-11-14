# fizzbuzz.rb
# October 25,2018

# Write a method that takes two arguments: the first is the strating number, ane
# the second is the ending number. Printing out all numbers between the two numbers,
# except if a number is dibisible by 3, print "Fizz", if a number is divisible
# by 5, print "Buzz", and finally if a number is divisible by 3 and 5, Print "FizzBuzz".

# Breakdown:
# Problem type: Iterate through a range, check conditonals

# - Write a method that takes two integer arguments.
# - num1 is the starting number, num2 is the ending number.
# - print out all the numbers in the range defined by num1 and num2 (inclusive).
# - If a number is divisible by 3, print "Fizz" rather than the number.
# - If a number is divisible by 5, print "Buzz" rather than the number.
# - If a number is divisible by 3 and 5, print "FizzBuzz" rather than the number.

# Questions/assumptions:
# What about negative numbers?

def fizzbuzz1(num1, num2)
  num1.upto(num2) do |i|
    if i % 3 == 0 && i % 5 == 0
      print "FizzBuzz"
    elsif i % 3 == 0
      print "Fizz, "
    elsif i % 5 == 0
      print "Buzz, "
    else
      print "#{i}, "
    end
  end
  puts
end

def fizzbuzz2(n1, n2)
  (n1..n2).each do |n|
    case
    when n % 3 == 0 && n % 5 == 0
      print "FizzBuzz"
    when n % 3 == 0
      print "Fizz"
    when n % 5 == 0
      print "Buzz"
    else
      print n
    end
    n != n2 ? print(", ") : puts
  end
end

fizzbuzz1(1, 15)
fizzbuzz2(33, 68)
