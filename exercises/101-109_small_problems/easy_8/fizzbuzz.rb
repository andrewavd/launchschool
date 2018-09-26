# fizzbuzz.rb
# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers
# between the two numbers, except if a number is divisible by 3, pring "Fizz", if a number is divisible by 5, print "Buzz". and finally
# if a number is divisible by 3 and 5. print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if num % 3 == 0 && num % 5 == 0
      print "FizzBuzz "
    elsif num % 3 == 0
      print "Fizz "
    elsif num % 5 == 0
      print "Buzz "
    else
      print "#{num} "
    end
  end
  puts
end

fizzbuzz(1, 15)
