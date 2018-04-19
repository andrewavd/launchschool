# Use the dates from the previous example and store them in an array.
# Then make your program output the same thing as exercise 3.

movie_dates = [1977, 2016, 1995, 1994, 2018]

puts movie_dates[0]
puts movie_dates[1]
puts movie_dates[2]
puts movie_dates[3]
puts movie_dates[4]

puts

# iteration
movie_dates.each { |x| puts "#{x}"}
