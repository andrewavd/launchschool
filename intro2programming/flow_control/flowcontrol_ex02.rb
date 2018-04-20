# Write a method that takes a string as argument. The method should return a new,
# all-caps version of the string, only if the string is longer than 10 characters.
# Example: change "hello world" to "HELLO WORLD".

def convert(target)
  if target.length > 10
    return all_caps = target.upcase
  end
  return target
end

puts convert("all is well in the world")
puts convert("hello")