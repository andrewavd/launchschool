matz = Hash.new("nil")
matz["First name"] = "Yukihiro"
matz["Last name"] = "Matsumoto"
matz["Age"] = 47
matz["Nationality"] = "Japanese"
matz["Nickname"] = "Matz"

# Iteration single line style.
puts "The values of the hash being output using single line style iteration."
matz.each { |key, value| puts "#{value}"}

# Iteration block style.
puts "The values of the hash being output using block style iteration."
matz.each do |key, value|
  puts matz[key]
end

# Convert strings to symbols
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
puts "string elements: #{strings}"

symbols = []

# Convert strings array elements to symbols using .to_sym method and push to symbols array.
strings.each { |s| symbols.push(s.to_sym) }
puts "symbol elements: #{symbols}"
# Convert symbols array elements from symbols to strings using .to_s method.
symbols.map! { |s| s.to_s }
puts "string elements: #{symbols}"
# Convert symbols array back from strings to symbols using .intern method.
symbols.map! { |s| s.intern }
puts "symbol elements: #{symbols}"

# .select method
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

good_movies = movie_ratings.select { |x, y| y > 3 }
puts "#{good_movies}"

