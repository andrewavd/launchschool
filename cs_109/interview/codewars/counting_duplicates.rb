# duplicate_count.rb
# November 5, 2018

# Problem:
#

def duplicate_count(text)
  text = text.downcase
  result = 0
  hsh = {}
  text.each_char do |char|
    if hsh.has_key?(char)
      hsh[char] += 1
    else
      hsh[char] = 1
    end
  end
  hsh.each_value { |v| result += 1 if v > 1 }
  result
end

p duplicate_count('aabbcddde')
