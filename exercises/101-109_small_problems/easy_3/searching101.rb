# Searching 101

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

def prompt(msg)
  print "=> #{msg}"
end

def does_not(nums, test)
  nums.include?(test) ? 'does' : 'does not'
end

nums = []
num_table = {
  1 => '1st',
  2 => '2nd',
  3 => '3rd',
  4 => '4th',
  5 => '5th'
}

(1..5).each do |x|
  prompt("Enter the #{num_table[x]} number: ")
  nums << gets.chomp.to_i
end

prompt "Enter 'test' number: "
test = gets.chomp.to_i

puts "The number #{test} #{does_not(nums, test)} appear in #{nums}."