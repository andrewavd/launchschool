# easy_4.rb
# November 26, 2018

# Question 1

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

# Question 2 answer
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi               # => Hello

# hello.bye            # => Error: undefined method 'bye'...

# hello.greet          # => Error: expecting 1 argument, received 0

hello.greet("Goodbye") # => Goodbye

# hello.hi             # Undefined local variable or method 'hello'...

puts "----------"

# Question 2: Using the code from Q 1. If we call `hello.hi` we get an error, how do you fix
# this?
# Answer: Create an instance of `Hello` named `hello` OR create a `hi` method on the `Hello`
# class. 

# Queston 3: How do we create two different instances of this class, both with separate names
# and ages>

class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hissss!!!"
  end
end

doe = AngryCat.new(3, "Doe")
blacky = AngryCat.new(2, "Blacky")

# Question 4: If we created a new instance of the class and then called `to_s` on that instance
# we would get something like "#<Cat:0x007ff39b356d30>". How could we change `to_s` output on
# this method to liik like this: "I am a wild cat"?

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{@type} cat"
  end
end

doe = Cat.new('wild')
doe.to_s

puts "----------"

# Question 5: What would happen if I called the methods like shown below?

class Television
  def self.manufacturer
    puts "manufacturer"
  end

  def model
    puts "model"
  end
end

tv = Television.new
# tv.manufacturer  Error: Undefined method 'manufacturer' for #<Television:0x00005559cc393958>
tv.model             # model would execute

Television.manufacturer # manufacturer would execute
# Television.model  Error: undefined method `model' for Television:Class

puts "----------"

# Question 6: In the `make_one_year_older` method we have used `self`. What is another way we
# could write this method so we don't need to use the `self` prefix?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
