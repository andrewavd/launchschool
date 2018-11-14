# format_names.rb
# November 6, 2018
# 6kyu
# Completion time: Did not complete in < 30.

# Problem:
# Given: an array containing hashes of names

# Return: a string formatted as a list of names separated by commas except for the last two names, 
# which should be separated by an ampersand.

# Codewars provided solution:
def list(arr)
  arr = arr.map { |hsh| hsh[:name] }
  last_name = arr.pop
  return last_name.to_s if arr.empty?
  "#{arr.join(', ')} & #{last_name}"
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]) == 'Bart, Lisa & Maggie'
p list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'
p list([ {name: 'Bart'} ]) == 'Bart'
p list([]) == ''