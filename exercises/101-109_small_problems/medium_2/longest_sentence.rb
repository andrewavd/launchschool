# longest_sentence.rb
# September 30, 2018

# file = File.open('gettysburg.txt')
file = File.open('pg84.txt')

text = file.read
# print gettysburg

working_arr = text.split

longest = ['', 0]
build_sentences = []
sentences = []
sentence_data = []
sentence = ''
word_count = 0

working_arr.each do |word|
	build_sentences << word
	word_count += 1
	if word.include?('.') | word.include?('?') | word.include?('!')
		sentences << build_sentences.join(' ') << word_count
		sentence_data << sentences
		build_sentences = []
		sentences = []
		sentence = ''
		word_count = 0
	end
end

sentence_data.each do |arr|
	longest = arr if arr[1] > longest[1]
end
puts "#{longest[0]} is #{longest[1]} words long."

# Provided Solution:
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"