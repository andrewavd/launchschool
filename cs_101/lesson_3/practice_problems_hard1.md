# Question 1
What do you expect to happen when the greeting variable is referenced in the last line of the code below?
```ruby
if false
    greeting = "hello world"
end

greeting
```
My Solution: An error will be generated for an undefined variable.
Correct Solution: No error will be generated because greeting was set to nil by the if satement even though it wasn't executed. So if the program did not contain the if statement my solution would be correct.

# Question 2
What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
My Solution: { a: 'hi' }
Correct Solution: { a: 'hi there' } This makes sense because informal_greeting = greetings[:a] created a shared object id between greetings and informal_greeting. When ' there' was APPENDED, not re-assigned, greetings content changed.

If we wished to keep greetings un-mutated re-assignment is the key. A couple of options:
informal_greeting = greetings[:a].clone
or
informal_greeting = informal_greeting + ' there'

# Question 3
In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
Solution: shared object id is broken by reassignment.
puts "one is: #{one}" => "one"
puts "two is: #{two}" => "two"
puts "three is: #{three}" => "three"

B)
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
Solution: shared object id is broken by reassignment.
puts "one is: #{one}" => "one"
puts "two is: #{two}" => "two"
puts "three is: #{three}" => "three"

C)
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```
Solution: no reassignment.
puts "one is: #{one}" => "two"
puts "two is: #{two}" => "three"
puts "three is: #{three}" => "one"

# Question 4
Ben was tasked to write a somple ruby method to deremine if an input string is an IP address represintin dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_address? that derermines if a string is a valid IP address number and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```
Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.
Solution:
```ruby
def is_an_ip_number?(word)
  true
  #false
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length != 4
    puts("Invalid input")
    return false
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

p dot_separated_ip_address?("10.4.5.11")
p dot_separated_ip_address?("4.5.11")
p dot_separated_ip_address?("10.4.5.11.10")
````
