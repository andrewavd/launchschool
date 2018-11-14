# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# input: 2 strings
# output: boolean

=begin
step by step breakdown/rules:
  - Write a method named substring_test(str1, str2)
  - create all the substrings for each of the two strings.
  - discard the single letter substrings if they were created.
  - iterate through the smaller of the created substring set (an array) and check if any of the iterations are included in the larger
    substring set.
  - return true or false depending on the include? condition.
=end

# Questions/assumptions:
# if either string is empty, return is false because there is nothing to compare.

=begin
algorithm:
  1) check to see if either string is empty, if so return false.
  2) downcase both strings so comparisons aren't biased.
  3) create the string to be iterated through.
    - index(0).upto(str.size - 1) do |i|
  4) iterate through str[i..str.size] to create the substrings and store them in an array.
  4)
=end

=begin
sandbox:
Breaking down strings into substrings:
=end

def substrings(str)
  subs = []
  result = ''
  str.downcase.each_char do |char|
    result = result + char
    subs << result
  end
  subs
end

def create_subs(str)
  subs = []
  0.upto(str.size - 1) { |i| subs << substrings(str[i..str.size]) }
  subs
end

def substring_test(str1, str2)
  return false if str1.empty? || str2.empty?
  subs1 = create_subs(str1).flatten.delete_if { |str| str.size == 1 }
  subs2 = create_subs(str2).flatten.delete_if { |str| str.size == 1 }
  # Makes subs1 the smaller array if it isn't already
  subs1, subs2 = subs2, subs1 if subs1.size > subs2.size
  subs1.any? { |substring| subs2.include?(substring) }
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Metropolitan') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
