# upcase_words.rb
# October 30, 2018

# IMPORTANT: You can't mutate a character in a string because the string itself is the object, the individual characters are not objects, unlike the 
# elements in an array. With a string, you must manipulate the character and re-assign it to the string to mutate the string!

# The example in the video is, arguably, incorrect. String#capitalize is suspect because it capitalizes the first letter of a string but downcases the
# remainder of the letters. This would cause a failure in 'javaScript' in the second test.



def word_cap(str)
  str.split.each { |word| word[0] = word[0].upcase }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The JavaScript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
