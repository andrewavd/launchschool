def substrings(str)
  result = []
  (0..str.size - 1).each do |i|
    word = str[(i..str.size - 1)]
    sub_str = ''
    word.each_char do |char|
      sub_str = sub_str + char
      result << sub_str
    end
  end
  result
end

def length_of_longest_substrings(str)
  subs = substrings(str)
  long = 0
  long_word = ''
  subs.each do |word|
    if word.chars.sort.join == word.chars.sort.join.squeeze
      if word.size > long
        long = word.size 
        long_word = word
      end
    end
  end
  p long_word
  long
end

p length_of_longest_substrings("abcabcbb") # "abc" 3
p length_of_longest_substrings("bbbbb") # "b" 1
p length_of_longest_substrings('pwwkew') # "wke" 3