# Building and sorting an array
words = []
flag = true
while flag
  print "Please enter a word: "
  word = gets.chomp
  word != "" ? (words.push word) : flag = false
end
#puts words.sort
puts words.sort_by { |x| x.downcase }

# Table of Contents
line_width = 100
contents = [['1', 'Getting Started', ' 1'], ['2', 'Numbers', ' 9'], ['3', 'Letters', '13']]

puts "Table of Contents".center(line_width)
line_width.times { print "-" }
puts
contents.each { |x, y, z| puts "Chapter #{x}:  #{y}".ljust(line_width/2) + "page #{z}".rjust(line_width/2) }
