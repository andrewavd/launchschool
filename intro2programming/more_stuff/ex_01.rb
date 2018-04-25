# Write a program that checks if the sequence of characters "lab"
# exists in the following strings. If it does exist, print out the word.


def check_exp(string)
  puts "Checking to see if \"#{string}\" contains \"lab\"."
  if /lab/.match(string)
    puts "#{string} contains a match!"
  else
    puts "No match!"
  end
end

check_exp("labratory")
check_exp("experiment")
check_exp("Pans Labyrinth")
check_exp("elaborate")
check_exp("polar bear")
