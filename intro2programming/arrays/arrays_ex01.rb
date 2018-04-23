# Below we have given you an array and a number. Write a program that
# checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

puts "#{number} is included in array #{arr}: #{arr.include?(number)}"

# iterating through the array and comparing for desired values is also possible

arr.each do |x|
  if x == number
    puts "#{number} is included in array #{arr}."
  end
end
