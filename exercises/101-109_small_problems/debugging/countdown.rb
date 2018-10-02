# countdown.rb
# October 2, 2018

# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program
# successfully counts down from 10 to 1.

# Further Exploration:
# We specify 10 two times, which looks a bit redundant. It should be possible to specify it
# only once. Can you frfactor the code accordingly?

def decrease(counter)
  counter -= 1
end

counter = 10

# 10.times do
counter.times do # Further exploration
  puts counter
  counter = decrease(counter) # value returned from method needed to be assigned.
  # decrease(counter)
end

puts 'LAUNCH!'