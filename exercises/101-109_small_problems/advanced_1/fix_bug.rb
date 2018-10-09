# fix_bug.rb
# October 9, 2018

# The following code:
# is expected to output the results below, it does not. Find and fix the issue(s).

def my_method(array)
  if array.empty?
    []
  # elsif
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])        # original output: [], expected ==> []
p my_method([3])       # original output: nil, expected ==> [21]
p my_method([3, 4])    # original output: nil, expected ==> [9, 16]
p my_method([5, 6, 7]) # original output: nil, expected ==> [25, 36, 49]

# The original elsif statement on ln 10 did not have an obvious conditional, so we added one
# that produced the expected output. So why was the output nil for all but an empty array
# in the original code? Ruby will look for the conditional on the following line(s), in this
# case ruby found the conditional on the next line in the form of the #map method being called
# on array with its' associated block. That expression evaluates truthy and as such the elsif
# branch is executed. There is no code in the elsif branch so it is equivalent to nil, thus
# nil is returned for all conditions other than an empty array.