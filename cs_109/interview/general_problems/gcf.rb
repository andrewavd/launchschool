# gcf.rb
# November 4, 2018

=begin
Problem:
Using the Ruby language, have the function Division(num1,num2) take both parameters being passed and 
return the Greatest Common Factor...
 Examples:
 Input: 7, 3 => 1
 Input: 36, 54 => 18

 Breakdown:
 - Write a method that takes two integers and returns the greatest common factro of the two.

 Input:
 two integers
 Output:
 integer, representing the greatest common factor of two integers.

 Rules:
 - GCF: is the largest number that divides evenly into two numbers.

 Algorithm:
 - Write a method, find_gcf(num1, num2), that takes two integers.
 - initialize variable lo to the lesser of num1 and num2.
 - initialize variable hi to the higher of the two numbers.
 - initialize variable gcf = 1
 - loop until lo divides evenly into the hi.
  - if true, the smaller num is the gcf break from loop
  - if false, subtract 1 from lo.
- return gcf

Tests:
p find_gcf(7, 3)
p find_gcf(36, 54)

 Questions:
 - What is the range of the two input numbers?
 - will inputs ever be equal?
=end

def find_gcf(num1, num2)
  if num1 < num2
    lo = num1
    gcf = num1
    hi = num2
  else
    lo = num2
    gcf = num2
    hi = num1
  end

  until hi % gcf == 0 && lo % gcf == 0
    gcf -= 1
  end
  gcf
end

p find_gcf(2, 4) == 2
p find_gcf(7, 3) == 1
p find_gcf(36, 54) == 18