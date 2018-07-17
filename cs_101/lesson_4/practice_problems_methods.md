# Question 1
What is the return value of the select method below? Why?
```ruby
[1, 2, 3].select do |num|
num > 5
'hi'
end
```
Solution:
.select returns [1, 2, 3] because the block returns true on each iteration from the last statement in the block which is 'hi'. If 'hi' was removed, an empty array would be returned because the num > 5 conditional would return false.

# Question 2
How does count treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'catepillar'].count do |str|
str.length < 4
end
```
Solution:
Since a block is given, count counts the number of elements for which the conditional str.length < 4 is met. In this case, => 2. Behavior of .count can be determined by reading docs. http://ruby-doc.org/core-2.5.1/Array.html#method-i-count

# Question 3
What is the return value of reject in the following code? Why?
```ruby
[1, 2, 3].reject do |num|
puts num
end
```
Solution: => [1, 2, 3] As the array is iterated through each element will be added to the returned array by reject because puts num statement will always return nil which has a truthiness of false.

# Question 4
What is the return value of each_with_object in the followin code? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
hash[value[0]] = value
end
```
Solution: (I had to ru irb to figure this out)
=> { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' } On each iteration, the first letter of each string is used as a hash key and the string itself becomes the value associated with that key.

# Question 5
What does shift do in the following code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```
Solution: Removes the a => 'ant' key, value pair and returns it as a two item array. => [:a, 'ant'] To confirm, check the docs. http://ruby-doc.org/core-2.5.1/Hash.html#method-i-shift

# Question 6
What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```
Solution: => 'catepillar' => 11 The method .pop removes the string element 'catepillar' from the array and the method .size returns 11. This is an example of "chaining" methods together.

# Question 7
What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code an what does it output?
```ruby
[1, 2, 3].any? do |num|
puts num
num.odd?
end
```
Solution: The block will return true/false on each iteration depending on if num is odd. If num.odd? evaluates to true on any iteration, .any? will return true.

# Question 8
How does take work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```
Solution: .take returns the first elemnt of the array. In this case an argument is passed, 2, so the first two elemnts will be returned. => [1, 2] .take is not destructive. Docs = http://ruby-doc.org/core-2.5.1/Array.html#method-i-take

# Question 9
What is the return value of map in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
if value.size > 3
value
end
end
```
Solution: => [[:b, 'bear']] .map creates an array of the values returned by the block. After checking in irb,my solution is wrong. => [nil, 'bear'] The if conditional itself returns a nil if it evaluates to false in this case because there is no "else" to return something different.

# Question 10
What is the return value of the following code? Why?
```ruby
[1, 2, 3].map do |num|
if num > 1
puts num
else
num
end
end
```
Solution: => [1, nil, ni] We just touched on this in #9 although this is the reverse. Iteration 1 returns num which is 1, the remaining iterations return nil.
