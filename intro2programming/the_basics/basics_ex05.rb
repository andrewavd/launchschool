# Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.

puts "Hey, this is above our current \"paygrade\"! We should get a discount on the first month's tuition lol!"
puts

nums = [5, 6, 7, 8]

nums.each do |num|
  puts "Factorial of #{num} is 1." if num <= 1
  index = num
  answer = num
  while num > 1
    answer = answer * (num - 1)
    num -= 1
  end
  puts "The factorial of #{index} is #{answer}." if index > 1
end

puts
puts "Ok, after looking at your solution, we stayed within our paygrade!"
puts

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1
