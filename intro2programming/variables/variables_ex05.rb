#=begin
puts "Case #1"
# I believe output will be 3
x = 0
3.times do
  x += 1
end
puts x
#=end

puts "Case #2"
# I believe the output will be an error for an undeclared local variable.
y = 0
3.times {x = 5}

puts x

# Side note...
# This was an interesting exercise for me. As you can see by comments above I predicted
# the correct output but that's not what I got... WHY???
# Because I didn't initially comment out Case 1. In Case 1, x = 0 with global scope, INCLUDING in case 2!
# My mind was treating case 1 & 2 as seperate and distinct scripts, obviously the machine wasn't! (rightfully so)