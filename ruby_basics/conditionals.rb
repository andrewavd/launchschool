# Unpredictable Weather (Part 1)
# In the code below, sun is randomlu assigned as 'visible' or 'hidden'.
# Write an if statement that pronts "The sun is so bright!" if sun equals 'visible'.

sun = ['visible', 'hidden'].sample
if sun == 'visible'
  puts "The sun is so bright!"
end
# puts "The sun is so bright" if sun == 'visible'

# Unprdictable Weather (Part 2)
# Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.

sun = ['visible', 'hidden'].sample
unless sun == 'visible'
  puts "The clouds are blocking the sun"
end

# Unpredictable Weather (Part 3)
# Write an if statement that prints "The sun is so bright!" if sun equals visible. Also write
# an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.

sun = ['visible', 'hidden'].sample
puts "The sun is so bright!" if sun == 'visible'
puts "The clouds are blocking the sun" unless sun == 'visible'

# True or False
# Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!"
# if boolean equals false.

boolean = [true, false].sample
puts "boolean = #{boolean}"
puts boolean ? "I'm true" : "I'm false!"

# Truthy Number
# What will the following code print? Why? Don't run it until you've attempted to answer.

puts "My answer: My favorite number is 7."
print "Solution: "

number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end

# Stoplight (Part 1)
# Write a cade statement that prints "Go!" if stoplight equala 'green', "Slow down!" if 
# stoplight equals 'yellow', and "Stop!" of stoplight eequals 'red'.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts "Go!"
when 'yellow'
  puts 'Slow down!'
when 'red'
  puts 'Stop!'
end

# Stoplight (Part 2)
# Conver the following case statement to an if statement.

stoplight = ['green', 'yellow', 'red'].sample

puts
puts "Stoplight Part 2"
puts

puts "Case Statement"
case stoplight
when 'green'
  puts "Go!"
when 'yellow'
  puts 'Slow down!'
when 'red'
  puts 'Stop!'
end

puts "If Statement"
if stoplight == 'green'
  puts "Go!"
elsif stoplight == 'yellow'
  puts "Slowdown!"
else
  puts "Stop!"
end

# Sleep Alert
# Write an if statement that returns "Be productive!" if status equals 'awake' and returns
# "Go to sleep!" otherwise. Then, assign the return value of the if statement to a variable
# and print that variable.

status = ['awake', 'tited'].sample

def sleep_alert(status)
  if status == 'awake'
    return "Be productive!"
  else
    "Go to sleep!"
  end
end

alert = sleep_alert(status)
puts alert

# OR

alert = if status == 'awake'
          "Be productive!"
        else
          "Go to sleep!"
        end

puts alert

# OR

alert = status == 'awake' ? "Ve productive" : "Go to sleep"
puts alert

# Cool Numbers
# Currently, "5 is a cool number!" is being printed every time the program is run.
# Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

number = rand(10)

if number == 5 # changed the = to ==
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# Stoplight (Part 3)
# Reformat the following case statement so that it only takes up 5 lines.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'yellow'
else
  puts 'Stop'
end

case stoplight
when 'green' then puts "Go!"
when 'yellow' then puts "Slow down!"
else puts "Stop!"
end

# 