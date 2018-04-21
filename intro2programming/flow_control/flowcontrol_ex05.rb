# Ex 3 -Write a program that takes a number from the user between 0 and 100
# and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

# Ex 5 - Rewrite your program from exercise 3 using a case statement.
# Wrap this new case statement in a method and make sure it still works.

def find_range(num)
  range = case
  when num < 0
    "#{num} is less than zero. (You didn't follow the directions!)"
  when num >= 0 && num <= 50
    "#{num} is between zero and fifty, inclusive."
  when num > 50 && num <= 100
    "#{num} is between fifty-one and one-hundred, inclusive."
  else
    "#{num} is greater than one-hundred. (You didn't follow the directions!)"
  end
  return range
end

print "Please enter a number between 0 and 100: "
num = gets.chomp.to_i

puts find_range(num)
