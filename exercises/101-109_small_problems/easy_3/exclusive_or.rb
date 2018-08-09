# Exclusive Or
 # The || operator returns a truthy value if either or both of its operands are
 # truthy, a falsey value if both operands are falsey. The && operator rerturns a
 # truthy value if both of its operands are truthy, and a falsey value if either
 # operand is falsey. This works great until you need only one of two conditions to
 # be truthy, the so called exclusive or.

 # In this exercise, you will write a method named xor that takes two arguments,
 # and returns true if exactly one of its arguments is truthy, false otherwise.

 # Example 1 - check every condition
 def xor?(a, b)
  return true if a && !b # a true, b false
  return true if !a && b # a false, b true
  return false if a && b # both true
  return false if !a && !b # both false
 end

 # Example 2 - check for exclusitivity, satisfying && implicitly = false
 def xor2?(a, b)
  return true if a && !b # a true, b false
  return true if !a && b # a false, b true
  false
 end

 # shortest version
 def xor3?(a, b)
  (a && !b) || (!a && b)
 end

 p xor?(5.even?, 4.even?)
 p xor?(5.odd?, 4.odd?)
 p xor?(5.odd?, 4.even?)
 p xor?(5.even?, 4.odd?)
puts "-----"
p xor2?(5.even?, 4.even?)
p xor2?(5.odd?, 4.odd?)
p xor2?(5.odd?, 4.even?)
p xor2?(5.even?, 4.odd?)
puts "-----"
p xor3?(5.even?, 4.even?)
p xor3?(5.odd?, 4.odd?)
p xor3?(5.odd?, 4.even?)
p xor3?(5.even?, 4.odd?)
