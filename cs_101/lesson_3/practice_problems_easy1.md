Question #1
What would you expect the code below to print out?

``` ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

Expected output:
1
2
2
3

Explanation: .uniq does not mutate the caller so numbers has not changed and we are outputting numbers. If we want to output the result of numbers.uniq then we must output numbers.uniq or mutate the caller by using .uniq!.

Key points from Solution:
- puts method automatically calls to_s on it's argument.
- p method automatically calls inspect on it's argument.
- puts numbers.inspect is the same as p numbers.

Qustion #2
Describe the difference between ! and ? in Ruby. Explain what would happen in the following scenarios:

1. What is != and where should you use it?
2. put ! before something like !user_name
3. put ! after something like words.uniq!
4. put ? before something
5. put ? after something
6. put !! before something like !!username

Explanation:
! and ? are not necessarily meaningful in and of themselves, context of use matters.
! and ? are not allowed in Ruby as part of a variable name.
! and ? can be part of a method name but are not part of the syntax and do not specifically do anything,
!= means not equal
!user_name will "reverse" the boolean value of user_name. Since all Ruby objects other than false and nil evaluate to true, !user_name will evaluate to false.
.uniq! is addressed above. ! at the end of a method is not meaningful by itself.
? before and after is addressed above.
!! will produce the objects boolean equivalent.

Question #3
Replace the word "important"with "urgent" in this string:
``` ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Solution:
``` ruby
advice.gsub('important', 'urgent')
```

Question #4
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
``` ruby
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
numbers.delete(1)
```
Solution:
.delete_at(1) will mutate numbers by deleting the value at index 1 of the array.
.delete(1) will mutate numbers by deleting all instances of the value 1.

Question #5
Programmatically determine if 42 lies between 10 and 100.
``` ruby
(10..100).cover?(42)
```

Queation #6
Starting with the string:
``` ruby
famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
famous_words.prepend("Four score and ")
famous_words = "Four score and " << famous_words
```

Question #7
Fun with gsub:
``` ruby
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

puts(eval(how_deep))
```

Result = 42

Question #8
If we build and array like this:
```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this nested array:
```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.
```ruby
p flintstones.flatten
```

Question #9
Given the hash below:
```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```
Turn this into an array cotaining only two elements: Barney's name and Barney's number
```ruby
flintstones.assoc("Barney")
```