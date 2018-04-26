# April 26, 2018
# Suppose you have a hash h = {a:1, b:2, c:3, d:4}
=begin
1. Get the value of key `:b`.

2. Add to this hash the key:value pair `{e:5}`

3. Remove all key:value pairs whose value is less than 3.5
=end

h = {
  a: 1,
  b: 2,
  c: 3,
  d: 4
}

puts "The value associated with key b: #{h[:b]}"

h[:e] = 5
puts "Updated hash: #{h}"

h.each { |k, v| h.delete(k) if v < 3.5 } #my way
# solution way: h.delete_if { |k, v| v < 3.5 }
puts "Updated hash: #{h}"
