# dasherizer.rb
# November 13, 2018
# 6kyu
# Completion time: 0:00

# Problem:
=begin
Write a method that takes in a number and returns a string, placing
a dash in between odd digits.
=end

def dasherizer(n)
  result = ''
  arr = n.to_s.chars
  (0..arr.size - 2).each do |i|
    if arr[i].to_i.odd? && arr[i+1].to_i.odd?
      result << arr[i] << '-'
    else
      result << arr[i]
    end
  end
  p result << arr[-1]
end

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'