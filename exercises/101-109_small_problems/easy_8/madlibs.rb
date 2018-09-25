# madlibs.rb
# Create a simple mad-lib program that prompta for a noun, a verb, an adverb, and an adjective and inficts those into a story that you
# create.

print "Enter a noun: "
noun = gets.chomp
print "\nEnter a verb: "
verb = gets.chomp
print "\nEnter an adjective: "
adjective = gets.chomp
print "\nEnter an adverb: "
adverb = gets.chomp
puts "\nPlease #{verb} your #{adjective} #{noun} #{adverb}!"
