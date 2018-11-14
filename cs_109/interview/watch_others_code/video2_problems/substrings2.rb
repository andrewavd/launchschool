# substrings2.rb
# October 29, 2018

def substring(str)
  result = []
  (1..str.size - 1).each { |i| result << str[0..i] }
  result
end

def substrings(str)
  result = []
  (0..str.size - 2).each { |i| result << substring(str[i..-1])}
  result.flatten
end

p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']