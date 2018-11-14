# reverse_string.rb
# October 22, 2018

# Write a method that will take a string as input, and return a new
# string with the same letters in reverse order.
#
# Don't use String's reverse method; that would be too simple.
#
# Difficulty: easy.

def reverse(string)
  reversed_str = ''
  idx = 0

  # Brute force looping.
  loop do
    break if string[idx] == nil
    reversed_str = string[idx] + reversed_str
    idx += 1
  end

  # Iteration rather than brute force looping:
  # string.each_char { |char| reversed_str = char + reversed_str }

  reversed_str
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #reverse")
puts("===============================================")
    puts(
      'reverse("abc") == "cba": ' + (reverse("abc") == "cba").to_s
    )
    puts(
      'reverse("a") == "a": ' + (reverse("a") == "a").to_s
    )
    puts(
      'reverse("") == "": ' + (reverse("") == "").to_s
    )
puts("===============================================")

  #string.each_char { |char| result.prepend(char)}