# Question 1
Given the array below, turn this array into a hash where the names are the keys and the values are the positions in the array.
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```
Solution: I did not know how to do this. I tried to overthink it.
```ruby
flintstones_hash = {}
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.each_with_index do |name, index|
flintstones_hash[name] = index
end
```

# Question 2
Add up all of the ages from the Munster family hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```
Solution:
```ruby
age_sum = 0
ages.each do |key, value|
  age_sum += value
end
# or
ages.each { |_,value| age_sum += value }
```

# Question 3
In the age hash, throw out the really old people.
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
Solution:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.each do |key, value|
if value > 99
ages.delete(key)
end
end
# or
ages.delete_if { |_,value| value > 99 }
```

# Question 4
Pick out the minimum age from our curerent Munster family hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```
Solution:
```ruby
low_age = 10000
ages.each do |key, value|
  if value <= low_age
    low_age = value
  end
end
#or
ages.values.min
```
# Question 5
In the array find the index of the first name that starts with "Be".
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
Solution:
```ruby
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts index
  end
end
# or
flilntstones.index { |name| name[0, 2] == "Be" }
```

# Question 6
Amend this array so that the names are all shortened to just the first three characters:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```
Solution:
```ruby
flintstones.map { |name| name[0, 3] }
```

# Question 7
Create a hash that expressed the frequency with which each letter occurs in this string:
```ruby
statement = "The Flintstones Rock"
```
Solution:
```ruby
hash = Hash.new
arr_of_statement = statement.chars
unique_chars = arr_of_statement.uniq
unique_chars.delete(' ')
unique_chars.each do |char|
  hash[char] = arr_of_statement.count(char)
end
```

# Question 8
What happens when we modify an array while we are iterating over it? What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
p number
numbers.shift(1)
end
```
Solution: => 1 2 3 4 I got this wrong initially but understood once I ran the code.
Correct solution: => 1 3 The iteration keeps track of the index. On the first iteration the index is 0 and 1 is output. numbers.shift(1) removes 1 leaving [2, 3 4]. As iteration #2 begins the index is 1 which is now pointing at element 3. 3 is output, element 2 is removed [3, 4]. The index becomes 2 which returns nil because it is out of bounds.

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
p number
numbers.pop(1)
end
```
Solution: => 1 2

# Question 9
As wwe have seen previously we can ud=se some built-in string methods to change the case of a string, A notably missing method id something provided in Rails, but not in Ruby itself... titleize. This method in Ruby on Rails creates a string that has each word capitalizes as ot would be in a title. For example, the string:
```ruby
words = "the flintstones rock"
```
would be:
```ruby
words = "The Flintstones Rock"
```
Write your own version of the rails titleize implementation.
Solution:
```ruby
words = "the flintstones rock"
arr = words.scan(/\w+/)
arr.each { |word| word.capitalize! }
title = arr.join(' ')
# or
words.split.map { |word| word.capitalize }.join(' ')
```

# Question 10
Given the Munsters hash below
```ruby
munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female" }
}
```
Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member id in (kid, adult, or senior). Your solutuion should produce the hash below:

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
  }
```
Note: kid = 0-17, adult = 18-64, senior 65+.
Solution:
```ruby
munsters.each do |key, value|
if munsters[key]["age"] < 18
  munsters[key]["age_group"] =  "kid"
elsif munsters[key]["age"] < 65
  munsters[key]["age_group"] = "adult"
else
  munsters[key]["age_group"] = "senior"
end
end
'''
