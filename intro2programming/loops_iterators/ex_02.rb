# Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user.

flag = true
while flag
  print "Please enter something: "
  user_input = gets.chomp
  puts "You entered: \"#{user_input}\"."
  flag = false if user_input.upcase == "STOP"
end