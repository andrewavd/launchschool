# swap_case.rb
# Write a method that takes a string as an argument and returns a new string in which every uppercase
# letter is replaced by its lowercase version, and every lowercase letter by its uppercase version.
# All other characters should be unchanged.

LOWERCASE = ('a'..'z')
UPPERCASE = ('A'..'Z')

def swapcase(str)
  result = str.chars.map do |char|
    if LOWERCASE.include?(char)
      char.upcase
    else UPPERCASE.include?(char)
      char.downcase
    end
  end
  result.join
end

p swapcase('CamelCase')         # == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') # == 'tONIGHT ON xyz-tv'