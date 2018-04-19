# Write a program that uses a hash to store a list of movie titles
# with the year they came out. Then use the puts command to make
# your program print out the year of each movie to the screen.

movie_list = {
  :'Star Wars' => '1977',
  :'Rogue One' => '2016',
  :'Heat' => '1995',
  :'Shawshank Redemption' => '1994',
  :'Player One' => '2018',
}

puts movie_list[:'Star Wars']
puts movie_list[:'Rogue One']
puts movie_list[:'Heat']
puts movie_list[:'Shawshank Redemption']
puts movie_list[:'Player One']

puts

# iteration
movie_list.each { |title, year| puts "#{year}" }
  