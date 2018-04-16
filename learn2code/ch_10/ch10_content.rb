# Learn to Program - Second Edition : Chapter 10, by Chris Pine
# The following is content from chapter 10.
# The output is unlikely to make sense unless the code is being followed.

puts "The following output may not make much sense unless you are following along with the code."

# psyche questionaire using recursion rather than while
=begin
def ask(question)
    puts question
    answer = gets.chomp.downcase
    if (answer == 'yes' || answer == 'no')
    answer == 'yes' ? (return true) : (return false)
    else
    puts 'Please answer "yes" or "no".'
    ask(question)
    end
  end
  
ask('Do you like eating tacos?')
ask('Do you like eating burritos?')
wets_bed = ask('Do you wet the bed?')
ask('Do you like eating chimichangas?')
puts 'Just a few more questions...'
ask('Do you like eating sopapillas?')
ask('Do you like drinking horchata?')
ask('Do you like eating flautas?')
puts
puts "DEBRIEFING:"
puts 'Thank you for taking the time to help with'
puts 'this experiment. In fact, this experiment'
puts 'has nothing to do with Mexican food. It is'
puts 'an experiment about bed-wetting. The Mexican'
puts 'food was just there to catch you off guard'
puts 'in the hopes that you would answer more'
puts 'honestly. Thanks again.'
puts
puts "Bed wetting is an issue: " + wets_bed.to_s
=end
  # Factorial using recursion
  def factorial num
    if num < 0
      return puts "You can't take the factorial of a negative number."
    end
    if num <= 1
      1
    else
      num * factorial(num-1)
    end
  end

  print "Enter the integer you wish a factorial for: "
  num = gets.chomp.to_i
  puts "the factorial for #{num} is: " + factorial(num).to_s

# Civilazations III
M = "land"
o = "water"

world = [[o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,M,M,o,o,o,o,o],
         [o,o,o,M,o,o,o,o,M,M,o],
         [o,o,o,M,o,o,o,o,o,M,o],
         [o,o,o,M,o,M,M,o,o,o,o],
         [o,o,o,o,M,M,M,M,o,o,o],
         [o,o,o,M,M,M,M,M,M,M,M,M,M],
         [M,M,M,M,M,o,M,M,M,o,o],
         [o,o,o,o,o,o,M,M,o,o,o],
         [o,M,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,M,o,o,o,o,o]]

def continent_size(world, row, col)
  if row < 0 || col < 0 || row > world.length - 1  || col > (world[row].length) - 1
    return 0
  end
  if world[row][col] != "land"
    return 0
  end

  size = 1
  world[row][col] = "counted land"

  size = size + continent_size(world, row-1, col-1)
  size = size + continent_size(world, row, col-1)
  size = size + continent_size(world, row+1, col-1)
  size = size + continent_size(world, row-1, col)
  size = size + continent_size(world, row+1, col)
  size = size + continent_size(world, row-1, col+1)
  size = size + continent_size(world, row, col+1)
  size = size + continent_size(world, row+1, col+1)
  size
end

start_row = 0
start_col = 5
puts continent_size(world, start_row, start_col)


