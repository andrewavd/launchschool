# Question 1

In this hash of people and their age,
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

see if "Spot" is present.

```ruby
ages.has_key?("Spot")
```

Bonus: What are two other hash methods that would work hust as well for this solution?

```ruby
ages.include?("Spot")
ages.member?("Spot")
```

# Question 2

Starting with this string:
```ruby
munsters_description = "The Munsters are creepy in a good way."
```
Convert the string in the following ways (code will be executed on original munsters_description above):
"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

```ruby
munsters_description.capitalize
munsters_description.swapcase
munsters_description.downcase
munsters_description.upcase
```

# Qustion 3

We have most of the Munster family in our age hash:
```ruby
ages = {  "Herman" =>, "Lily" => 30, "Grandpa" = > 5843, "Eddie" =>}
```
add ages for Marilyn and Spot to the existing hash
```ruby
additional_ages =  { "Marilyn" => 22, "Spot" => 237 } # provided
# solution
ages.merge!(additional_ages)
```

# Question 4

See if the name "Dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your per dinosaur." # given
# solution
advice.include?("Dino")
advice.match("Dino") # provided solution
```

# Question 5

Show an easier way to write this array:
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"] # given
# solution
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

# Question 6

How can we add the family pet "Dino" to our usual array?
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # given
# solution
flintstones.push("Dino")
flintstones << "Dino" # provided solution
flintstones.concat("Dino")
```

# Question 7

In the previous practice problem we added Dino to our array.
How can we add multiple items to our array? (Dino and Hoppy)

```ruby
flintstones.push("Dino").push("Hoppy")
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]
# push returns the array so we can chain
flintstones.concat(%w(Dino Hoppy))
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", "Dino", "Hoppy"]
# concat adds the individual elements of the array(s)
flintstones << %w(Dino Hoppy)
# => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles", ["Dino", "Hoppy"]]
# Doesn't really work because the array of ["Dino", "Hoppy"] is added not the individual elements.
```

# Question 8

Shorten this sentence:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
...remove everything starting from "house".
Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the String#slice method instead?

```ruby
advice.slice!(0, advice.index('house'))
# returns "house training your pet dinosaur.
# advice is mutated to become "Few things in life are as important as "
advice.slice(0, advice.index('house'))
# returns "Few things in life are as important as"
# advice remains unchanged.
```

# Question 9

Write a one liner to count the number of lower case "t" characters in the dolowing string:
```ruby
statement = "The Flintstones Rock!"
statement.count('t')
```

# Question 10

Back in the stone age (before CSS) we used spaces to alilgn things on the screen. If we had a  40 character width table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = "Flintstone Family Members"
# solution
spaces = (40 - title.length) / 2
title.center(40) # provided solution
```
