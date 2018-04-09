def display(movies)
  movies.each { |title, stars| puts "#{title}: #{stars}"}
end
  
movies = {
  Tron: 1,
  Star_Wars: 5,
  Shawshank_Redemption: 4,
  I_Am_Legend: 5,
}

puts "What would you like to do?"
choice = gets.chomp

case choice
  when "add"
  	puts "Please enter a movie title:"
  	title = gets.chomp
  	puts "Please rate your #{title} (1 - 5):"
  	rating = gets.chomp
  	if movies[title.to_sym] == nil
      movies[title.to_sym] = rating.to_i
      display(movies)
    else
      puts "#{title} is already in the database."
    end
  when "update"
  	puts "Please enter a movie title:"
  	title = gets.chomp
  	if movies[title.to_sym] == nil
      puts "#{title} is not in the databas."
    else
      puts "Please rate #{title} (1 - 5):"
      rating = gets.chomp
      movies[title.to_sym] = rating.to_i
    end
  when "display"
  	display(movies)
  when "delete"
  	puts "Please enter a title to delete:"
  	title = gets.chomp
  	if movies[title.to_sym] == nil
      puts "#{title} is not in the databas."
    else
      movies.delete(title.to_sym)
      display(movies)
    end  	
  else
  	puts "Error - Invalid Choice!"
end