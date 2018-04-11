# The following is content from chapter 8.
# The output doesn't make much sense unless you are following the code.

puts "The following output may not make much sense unless you are following the code."

names = ['Ada', 'Belle', 'Chris']

puts names
puts
puts names[0]
puts names[1]
puts names[2]
puts names[3]

other_peeps = []
other_peeps[3] = 'beebee Meaner'
other_peeps[0] = 'ah-ha'
other_peeps[1] = 'seedee'
other_peeps[0] = 'beebee Ah-ha'
puts other_peeps

languages = ['English', 'Norwegian', 'Ruby']
puts
languages.each do |lang|
  puts "I love #{lang}!"
  puts "Don't you?"
end

puts "Let's hear it for Java!"
puts "<crickets chirping in the distance>"

3.times { puts "Hip-Hip_Hooray!"}
2.times do
  puts "...you can say that again..."
end

foods = ['artichike', 'brioche', 'caramel']

puts foods
puts
puts foods.to_s
puts
puts foods.join(', ')
puts
puts foods.join(' :) ') + ' 8)'
foods = ['artichoke', 'brioche', 'caramel', ['beef', 'chicken']]
puts foods

200.times do
  puts []
end

favorites = []
favorites.push 'raindrops on roses'
favorites.push 'whiskey on kittens'
favorites.push 10

puts favorites[0]
puts favorites.last
puts favorites.length
puts favorites.pop
puts favorites
puts favorites.length
