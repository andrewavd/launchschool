# dasherizer
# Octobr 30, 2018

def dasherizer(num)
  result = ''
  arr = num.to_s.chars
  (arr.size-1).times do |i|
    result << arr[i]
    result << '-' if arr[i].to_i.odd? && arr[i + 1].to_i.odd?
  end
  result << arr[-1]
  result
end

p dasherizer(2112) == '21-12'
p dasherizer(201105742) == '201-105-742'
p dasherizer(123456789) == '123456789'
p dasherizer(21121) == '21-121'