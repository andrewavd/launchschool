# end_is_near.rb
# Write a method that returns the next to last word in the String passed to it as an argument.

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') # == 'last'
p penultimate('Launch School is great!') # == 'is'
