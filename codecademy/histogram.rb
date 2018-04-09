# Histogram script
=begin
  This script accepts text input from the user,
  splits the input by " " and assigns each word
  to an array. Each word is then assigned to a 
  hash as a key and the number of occurences of the
  word are the value.
=end


puts "\nInput a phrase. The script will determine how many times each word in the phrase occurs."

print "\nPlease enter a phrase (no punctuation please): "
text = gets.chomp
# Need a way to count words regardless of capitalization.
# text.downcase!
words = text.split(" ")
frequencies = Hash.new(0)
words.each { |word| frequencies[word] += 1 }
frequencies = frequencies.sort_by { |a, b| b }
frequencies.reverse!
frequencies.each { |word, count| puts "#{word}" + " " + "#{count}"}