# lettercase_ratio.rb
# October 1, 2018

# Write a method that takes a string and then returns a hash that contains 3 entries: one
# represents the percentage of characters in the string that are lowercase letters, one the
# percentage of characters that are uppercase letters, and one the percentage of characters
# that are neither.

LOWERCASE = ('a'..'z')
UPPERCASE = ('A'..'Z')

def letter_case_count(str)
  hsh = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  str_size = str.size
  lowercase = 0
  uppercase = 0
  neither = 0

  str.chars.each do |char|
    if LOWERCASE.include?(char)
      lowercase += 1
    elsif UPPERCASE.include?(char)
      uppercase += 1
    else
      neither += 1
    end
  end
  
  hsh[:lowercase] = lowercase / (str_size.to_f) * 100
  hsh[:uppercase] = uppercase / (str_size.to_f) * 100
  hsh[:neither] = neither / (str_size.to_f) * 100
  hsh
end

p letter_case_count('abCdef 123') # == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_case_count('AbCd +Ef')   # == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_case_count('123')        # == { lowercase: 0, uppercase: 0, neither: 100 }
