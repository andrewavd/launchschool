# string_scramble.rb
# November 5, 2018

=begin
Problem:
Using the Ruby language, have the function StringScramble(str1,str2) take both parameters being passed 
and return the string true if a portion of str1 characters can be rearranged to match str2, otherwise 
return the string false...

Breakdown:
- Write a method string_scramble(str1, str2) that takes two strings as arguments.
- Determine if str1 can be rearranged to form str2.
- return true if str1 can meet above criteria and false if not.

Rules:
- The characters of str1 are to be "rearranged" to form str2, so they can only be used once.

Input: 2 strings
Output: UNCLEAR - boolean true/false or String assigned to value 'true' or 'false'

Algorithm:
- initialize variable result = true
- iterate thru str2. str2.each_char
- check if current element of iteration is included in str1
  - if false, set result = false
- return reult


Questions:
- Can str1 have "extra" characters?
  - It appears yes. return the string true if a portion of str1 characters can be rearranged to match str2"
- Return the String 'true'/'false' or the boolean?
- Can each character from str1 only be used once? Example: str1 = 'ab' str2 = 'abba'
=end

def string_scramble(str1, str2)
  result = true
  str2.each_char do |c|
    result = false if !str1.include?(c)
  end
  result
  #str2.each_char.all? { |c| str1.include?(c) }
end

p string_scramble('h3llko', 'hello') == false
p string_scramble('cdore', 'coder') == true