# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

def substrings(str)
  str = str.downcase
  result = []

  (0..str.size - 1).each do |idx|
    word = str[idx..str.size]
    sub_str = word[0]
    (1..word.size - 1).each do |i|
      sub_str = sub_str + word[i]
      result << sub_str
    end
  end
  result
end

def substring_test(str1, str2)
  sub_strs1 = substrings(str1)
  sub_strs2 = substrings(str2)

  sub_strs1, sub_strs2 = sub_strs2, sub_strs1 if sub_strs2.size < sub_strs1.size

  sub_strs1.any? { |sub_string| sub_strs2.include?(sub_string) }
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