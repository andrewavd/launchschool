# May 15, 2018
# Use Ruby's Array method delete_if and String method start_with? to deleter all of the words
# that begin with an "s" in the following array.

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr2 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |a| a.start_with?("s") }
arr2.delete_if { |a| a.start_with?("s", "w") }

puts "arr = #{arr}"
puts "arr2 = #{arr2}"
