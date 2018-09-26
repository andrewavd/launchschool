# double_char.rb
# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  result = ''
  0.upto(str.size - 1) do |i|
    result << str[i] * 2
  end
  result
end

p repeater('Hello')
p repeater('Good job!')
p repeater('')
