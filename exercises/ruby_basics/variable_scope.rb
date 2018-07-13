# Part 1
# What will the following code print and why?
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a
# My answer: 7 (my_value will return 17, but the value of a is unchanged.)
# Actual answer: 7

# Part 2
# What will the following code print and why?
a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a
# My answer: 7 (my_value will return 17, but the value of a is still unchanged.)
# This is the exact same problem as #1. If you wanted to change the value of a that is located
# outside the function you would need to assign it the returned value. Example: a = my_value(a)
# Actual answer: 7

# Part 3
# What will the following code print and why?
a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a
# My answer: 7 (my_value will return 12, but the value of a is still unchanged.)
# This is the exact same problem as #1. If you wanted to change the value of a that is located
# outside the function you would need to assign it the returned value. Example: a = my_value(a)
# Actual answer: 7

# Part 4
# What will the following code print and why?
a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a
# My answer: 'Xyzzy' WRONG!
# The first 3 examples were working with numbers which are immutable. Strings are mutable.
# Specifically in this situation we are applying a mutating method (String#[]), it actually
# modifies the string. Be cognizant of mutating methods in these situations. Example: .upcase!
# Actual answer: 'Xy-zy'

# Part 5
# What will the following code print, and why?
a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a
# My answer: 'Xyzzy' (Although strings are mutable, no mutation was applied. Only a local 
# variable was changed.)
# Actual answer: 'Xyzzy'

# Part 6
# What will the following code print, and why?
a = 7

def my_value(b)
  a = 1 # added no error would be generated and remainder of code would run.
  b = a + a
end

my_value(a)
puts a
# My answer: 7 WRONG! (Error - undefined local variable 'a')
# Local variable 'b' gets the value passed in but 'a' is never declared.
# Actual answer: variable_scope.rb:79:in `my_value': undefined local variable or method `a'
#                      for main:Object (NameError) from variable_scope.rb:82:in `<main>'

# Part 7
# What will the following code print, and why?
a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a
# My answer: 3 ('a' is assigned an element of the array as it iterates through.
# Last iterration is 3)
# Actual answer: 3

# Part 8
# What will the following code print, and why?
x = 0 # added to eliminate error so remainder of code would run
array = [1, 2, 3]

array.each do |element|
  x = element
end

print 'Part #8: '
puts x
# My answer: 3 but... not sure if you can declare a variable initially in a block for global use.
# Actual answer: Error ...I guess you can't!
# Interesting aside: When I initially ran this it ran because instead of 'x' I was using 'a', I
# overlooked that I had been initializing 'a' through out the script... so part 8 ran without an
# error.

# Part 9
# What will the following code print, and why?
a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

print 'Part #9: '
puts a
# My answer: 4 (WRONG! The block argument |a| 'shadows' the global variable and thus
# a += 1 in effect becomes a local variable to the block.)
# Actual answer: 7

# Part 10
# What will the following code print, and why?
a = 7
array = [1, 2, 3]

def my_value(ary)
  a = 7 # added so code would run.
  ary.each do |b|
    a += b
  end
end

my_value(array)
print 'Part #10: '
puts a
# My answer: Error ('a' has not been delared within the function my_value.)
# Actual answer: Error