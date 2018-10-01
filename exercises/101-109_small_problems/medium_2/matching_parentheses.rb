# matching_parentheses.rb
# October 1, 2018
# Write a method that takes a string as an argument, and returns true if all parentheses in
# the string are properly balanced, false otherwise. To be properly balanced, parentheses
# must occur in matching ( and ) pairs.

def balanced?(str)
  left = []
  right = []
  str.each_char do |char|
    left.push(char) if char == '('
    right.push(char) if char == ')'
    return false if right.size > left.size
  end
  left.size == right.size ? true : false
end

p balanced?('What (is) this?')      # == true
p balanced?('What is) this?')       # == false
p balanced?('What (is this?')       # == false
p balanced?('((What) (is this))?')  # == true
p balanced?('((What)) (is this))?') # == false
p balanced?('Hey!')                 # == true
p balanced?(')Hey!(')               # == false
p balanced?('What ((is))) up(')     # == false