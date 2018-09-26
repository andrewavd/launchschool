# name_swap.rb
# Write a method that takes a first name, a space, and a last name passed as a single String argument,
# and returns a string that contains the last naem, a comma, a space, and the first name.

def swap_name(name)
  swap_arr = name.split
  swap_name = swap_arr[1] + ", " + swap_arr[0]
end

def swap_name_solution(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Andy Holmes')
