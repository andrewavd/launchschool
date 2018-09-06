# Write another method that returns true if the string passed as an argument is a palindrome, false
# otherwise. This time, however, your method should be case-insensitive, and it should ignorer all
# non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome?
# method you wrote in the previous exercise.

ALPHANUMERIC = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9]

def strip_non_alphanumeric(str)
  # regex
  # string = string.downcase.gsub(/[^a-z0-9]/, '')
  clean_str = ''
  str.each_char do |char|
    clean_str << char if ALPHANUMERIC.include?(char)
  end
  clean_str 
end

def reverse(str)
  str_arr = str.chars
  rev_str = ""
  loop do
    rev_str << str_arr.pop
    break if str_arr.size == 0
  end
  rev_str
end

def real_palindrome?(str)
  str = strip_non_alphanumeric(str.downcase)
  # brute force
  str == reverse(str)

  # str == str.reverse
end

p real_palindrome?('madam')           # == true
p real_palindrome?('Madam')           # == true (case does not matter)
p real_palindrome?("Madam, I'm Adam") # == true (only alphanumerics matter)
p real_palindrome?('356653')          # == true
p real_palindrome?('356a653')         # == true
p real_palindrome?('123ab321')        # == false