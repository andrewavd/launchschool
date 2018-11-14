# capitalize_words.rb
# October 23, 2018

# Write a method that takes in a string of lowercase letters and
# spaces, producing a new string that capitalizes the first letter of
# each word.
#
# You'll want to use the `split` and `join` methods. Also, the String
# method `upcase`, which converts a string to all upper case will be
# helpful.
#
# Difficulty: medium.

def capitalize_words(string)
  str_arr = string.split
  str_arr.each { |word| word[0] = word[0].upcase }.join(' ')
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #capitalize_words")
puts("===============================================")
    puts(
      'capitalize_words("this is a sentence") == "This Is A Sentence": ' +
      (capitalize_words("this is a sentence") == "This Is A Sentence").to_s
    )
    puts(
      'capitalize_words("mike bloomfield") == "Mike Bloomfield": ' +
      (capitalize_words("mike bloomfield") == "Mike Bloomfield").to_s
    )
    puts(
      'capitalize_words("javaScript lives") == "JavaScript Lives": ' +
      (capitalize_words("javaScript lives") == "JavaScript Lives").to_s
    )
puts("===============================================")












#   capitalized = string.split
#   puts capitalized[0]
#   puts capitalized[1]
  
#   i = 0 
#   j = 0
#   while i < capitalized.length
#     capitalized[i]
    
    
  
  
# #  return capitalized 