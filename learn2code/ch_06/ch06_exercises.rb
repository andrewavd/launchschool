# Angry boss
puts "What the hell do you want?"
demand = $stdin.gets.chomp
puts "WHADDAYA MEAN \"#{demand.upcase}\"?!? YOU'RE FIRED!"

# Table of contents
table_width = 100
puts "Table of Contents".center(table_width)
puts '-' * table_width
puts "Chapter 1: Getting Started".ljust(table_width/2) + "page  1".rjust(table_width/2)
puts "Chapter 2: Numbers".ljust(table_width/2) + "page  9".rjust(table_width/2)
puts "Chapter 3: Letters".ljust(table_width/2) + "page 13".rjust(table_width/2)
