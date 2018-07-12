# Question 1

Let's do some "ASCII Art" (A stone-age form of nerd artwork from back in the days before computers has video screens).

For this practice problem, write a one-line program that creates the following output 1o times, with the subsequent line indented 1 space to the right:

```ruby
10.times { |x| puts(' ' * x + "The Flintstones Rock!") }
```

# Question 2
The result of the following statement will be an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
Why is this and what are two possible ways to fix this?

Solution: We are attempting to output two different types, string and integer. 
```ruby
puts "the value of 40 + 2 is #{(40 + 2)}" # use interpolation
puts "the value of 40 + 2 is " + (40 + 2).to_s # use convert to string
```

# Question 3
Alan wrote the following method, which was intended to show all of the factors of the input number:
```ruby
def factors(number)
  dividend = number
  divisors = []
  begin
    break if number <= 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
```
Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin / end / until ? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
```ruby
def factors(number)
  dividend = number
  divisors = []
  while number > 0
    break if number <= 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
```
Bonus 1: What is the purpose of the number % dividend == 0
Solution: In english... Does number divided by dividend leave a remainder? if no ( == 0 ), dividend is a factor of number.
Bonus 2: What is the purpose of the second to last line in the method (the divisors before the methods end)?
Solution: It returns an array containing the factors of the passed in parameter number. Why, because there is no explicit return in this method. That being the case, the last executed statement in the method, divisors, is the return value of the method.

# Queation 4
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer bexomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```
Solution: Method buffer1 modifies buffer. Method buffer2 does not modify input_array.

# Question 5
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it he got an error. Something about the limit variable. What's wrong with the code?
```ruby
limit = 15

def fib(first_num, second_num)
  limit = 15 # my solution
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```
Solution: Variable scope for a method is limited to the method. The variable limit is defined outside the method so it is not accessible to the fib method. limit either needs to be passed into the fib method or defined inside the fib method. 

I would define limit within fib. See above.

# Question 6
In an earlier practice problem we saw that depending on variables to be modified by called methods can be tricky:
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.
How can we refactor this practice problem to make the result easier to predict and easier for the next programmer to maintain?

Solution: This problem is implying that they want my_string and my_array modified. Since there is no explicit return in tricky_method, only my_array will be modified as it is passed as an_array_param to tricky_method. an_array_param is the last statement executed so it will be returned.

Provided solution:
```ruby
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
This is NOT how I probalbly would have done it. I would have worked on passing only one parameter to modify one variable at a time.

# Question 7
What is the output of the following code?
```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```
Solution: 42 - 8 = 34

# Question 8
One day Soot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```
After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
```ruby
mess_with_demographics(munsters)
```
Did the family's data ger ransacked? Why or why not?

Solution: Yes, the data got ransacked. The mess_with_demographics method is passed the reference to the munsters hash and uses that reference while manipulating the values in the hash, so yes, the munsters hash has been changed by Spot's method call.

# Question 9
Method calls can take expressions as arguments. Suppose we define a function called rps as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.
```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```
What is the result of the following call:
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```
Solution: 
rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
rps(rps(rps("rock", "paper"), "rock"), "rock")
rps(rps("paper", "rock"), "rock")
rps("paper", "rock")
"paper"

# Question 10
Consider these two simple methods:
```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```
What would be the return value of the following method invocation?
```ruby
bar(foo)
```
Solution: 'no'
1) foo will always return 'yes'
2) bar is passed a parameter so param is pointing to value 'yes', when param is evaluated against 'no' boolean value is false so per conditonal, 'no' is returned.