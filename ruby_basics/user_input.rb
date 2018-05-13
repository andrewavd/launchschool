# Repeat after me
# Write a program that asks the user to type something in, after which your program 
# should simply display what was entered.

puts
puts "'Repeat After Me'"
puts "---------------"
puts

puts "Please type something in, anything you want!"
print "??? "
entry = gets.chomp
puts "You entered: #{entry}"

# Your age in months
# Write a program that asks the user for their age in years, and then converts that age to months.

puts
puts "'Your Age in Months'"
puts "---------------"
puts

print "How old are you (years)?? "
years = gets.chomp.to_i
months = years * 12
puts "You are #{months} months old!"

# Print Something
# Part 1
# Write a program that asks the user whether they want the program to print "something",
# then print it if the user enters "y". Otherwise, print nothing.

puts
puts "'Print Something - Part 1'"
puts "---------------"
puts

print "Would you like the computer to print a random number? (y/n)"
answer = gets.chomp
if answer.downcase == 'y'
  puts rand(1000)
end

# Print Something
# Part 2
# Modify your program so it prints an error message for any inputs that aren't 'y' or 'n'
# and then asks you to try again. Keep asking for a response until you receive a valid 'y'
# or 'n' response. In addition, your program should allow both 'Y' and 'N' (uppercase)
# responses; case sensitive input is generally a poor user interface choice. Whenever 
# possible, accept both uppercase and lowercase inputs.

puts
puts "'Print Something - Part 2'"
puts "---------------"
puts

def check_input(answer)
  #until answer == 'y' || answer == 'n'
  until %w(y n).include?(answer) # cleaner condition fron solution
    puts "Error - Invalid response."
    puts "Try again. Please enter 'y' or 'n'."
    answer = gets.chomp.downcase
  end
  answer == 'y' ? true : false
end

print "Would you like the computer to print a random number? (y/n) "
answer = gets.chomp.downcase
puts rand(1000) if check_input(answer)

# Launch School Printer
# Part 1
# Write a program that prints 'Launch School is the best!' repeatedly until a certain
# number of lines have been printed. The program should obtain the number of lines from
# the user, and should insist that at least 3 lines are printed.

# For now, just use #to_i to convert the input value to an integer, and check that result
# instead of trying to insist on a valild number; validation of numeric input is a topic
# with a fair number of edge conditions that are beyond the scope of this exercise.

puts
puts "'Launch School Printer - Part 1'"
puts "---------------"
puts

def check_input(answer)
  until answer >= 3
    puts "Error - Invalid response."
    puts "Try again. Please enter a number 3 or greater."
    answer = gets.chomp.to_i
  end
  answer
end

def get_output(answer)
    # Caps ridiculous requests
    if answer > 10
      puts "For real? You're getting a bit silly aren't you? As you wish..."
      puts
      answer = 10
    end
    #output request
    answer.times { puts "Launch School is the best!" }
    puts "...that's enough, I'm tired!" if answer > 9
  end

print "How many lines of output would you like? (3 is the minimum) "
answer = gets.chomp.to_i
get_output(check_input(answer))

# Passwords
# Write a program that displays a welcome message, but only after the user enters the 
# correct password, where the password is a string that is degined as a constant in
# your program. Keep asking for the password until the user enters the correct password.

puts
puts "'Passwords'"
puts "---------------"
puts

def check_input(pass)
  count = 0
  until pass == PASSWORD
    puts "Error - Invalid response."
    count += 1
    if count%5 == 0
      puts "After #{count} tries, you should probably hit ctrl+c and move on!"
    end
    print "Try again. Please enter the password: "
    pass = gets.chomp
  end
end

PASSWORD = 'ursilly0'

print "Please enter the password: "
pass = gets.chomp

check_input(pass)
puts "Welcome to the secret society of Ruby developers!"

# Username and Password
# In the previous exercese, you wrote a program to solicit a password. In this exercese,
# you shoukd modify the program so it also requires a username. The program should solicit
# both the username and the password, then validate both, and issue a generic error message
# if one or both are incorrect; the error message should not tell the user which item is incorrect.

puts
puts "'Username and Password'"
puts "---------------"
puts

def get_input(credentials)
  print "Please enter your username: "
  credentials[0] = gets.chomp
  print "Please enter your password: "
  credentials[1] = gets.chomp
  return credentials
end

def check_input(credentials)
  count = 0
  until credentials[0] == USERNAME && credentials[1] == PASS_WORD
    puts "Error - Invalid - Authorizaton Failed."
    count += 1
    if count%5 == 0
      puts "After #{count} tries, you should probably hit ctrl+c and move on!"
    end
    get_input(credentials)
  end
end

USERNAME = 'Andy'
PASS_WORD = 'Ursilly#0'
credentials = []

check_input(get_input(credentials))
puts "Welcome to the secret society of Ruby developers!"

# Dividing Numbers
# Write a program that obtains two integers from the user, then prints the results of
# dividing the first by the second. The second number must not be 0, and both numbers
# should be validated using this method: (included in the program)

puts
puts "'Dividing Numbers'"
puts "---------------"
puts

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_input(div_type)
  print "Please enter the #{div_type}: "
  var = gets.chomp
  until valid_number?(var)
    puts "Invalid input. Only integers are allowed."
    print "Please enter the #{div_type}: "
    var = gets.chomp
  end
  return var.to_i
end

def check_zero(var)
  until var != 0
    puts "Error - You can't divide by zero."
    var = get_input("denominator")
  end
  return var
end

numerator = get_input("numerator")
denominator = check_zero(get_input("denominator"))

puts "#{numerator} / #{denominator} = #{numerator / denominator}."

# Launch School Printer
# Part 2
# Modify part 1 so it repeats itself after each input/print itration, asking for a new number
# each time through. The program shoukd keep running until the user enters 'q' or 'Q'.

puts
puts "'Launch School Printer - Part 2'"
puts "---------------"
puts

def get_output(answer)
  # Caps "ridiculous" requests
  if answer > 10
    puts "For real? You're getting a bit silly aren't you? As you wish..."
    puts
    answer = 10
  end
  #output request
  answer.times { puts "Launch School is the best!" }
  puts "...that's enough, I'm tired!" if answer > 9
end

def check_input(answer)
  answer >= 3 ? get_output(answer) : puts("Invalid response - Please enter a number 3 or greater.")
end

def check_quit(answer)
  answer.downcase == 'q' ? false : true
end

def get_input()
  print "How many lines of output would you like? (3 is the minimum) "
  answer = gets.chomp
end

num_its = get_input()

while check_quit(num_its) #Does user wish to quit?
  check_input(num_its.to_i) #Has user met minimum lines requirement?
  num_its = get_input()
end

# Opposites Attract
# Write a program that requests two integers from the user, adds them together, and then
# displays the result. Furthermore, insist that one of the integers be positive, and one
# negative; however, the order in which the wwo integers are entered does not matter.
# Do not check for positive/negative requirement until after both integers are enered, and
# start over if the requirement is not met.

puts
puts "'Opposites Attract'"
puts "---------------"
puts

def check_posneg(int1, int2)
  if int1 * int2 > 0
    puts "Sorry, one integer must be positive, one must be negative."
    puts "Please start over."
    return true
  else
    return false
  end
end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_input()
  val_num = false
  until val_num
    print "Please enter a positeve or negative integer: "
    int = gets.chomp
    valid_number?(int) ? val_num = true : puts("Invalid input. Only non-zero intgegers are allowed.")
  end
  return int.to_i
end

puts
puts "INSTRUCTIONS"
puts "Enter two integers seperately. One MUST be positive, the other MUST be negative."
puts "Zero can Not be an entry."
puts

red_flag = true

while red_flag
  int_1 = get_input()
  puts "Integer #1 = #{int_1}"
  int_2 = get_input()
  puts "Integer #2 = #{int_2}"
  red_flag = check_posneg(int_1, int_2)
end
puts "#{int_1} + #{int_2} = #{int_1 + int_2}"
