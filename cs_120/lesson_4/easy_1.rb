# easy_1
# November 26, 2018

# Question 1: Which of the following are objects in Ruby? If they are objects, how can you 
# find out what class they belong to?
# Answer: They all are objects. (Everything in Ruby is an object.) CAll the .class method on
# each object to reveal its' class.

p true.class
p "hello".class
p [1, 2, 3, "Happy Days"].class
p 142.class

puts "----------"

# Question 2: If we have a `Car` class and a `Truck` class and we want to be able to `fo_fast`,
# how cna we add the ability for them to `go_fast` using the module `Speed`? How can you check
# if your `Car` or `Truck` can go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast."
  end
end

class Car
  include Speed # answer

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed # answer

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# answer
kenworth = Truck.new
fiesta = Car.new
fiesta.go_fast
kenworth.go_fast

# Question 3: When we called the go_fast method from an instance of the Car class you might 
#have noticed that the string printed when we go fast includes the name of the type of vehicle
# we are using. How is this done?
# Answer: `self` refers to the object itself, in this case an object (fiesta) of class Car. We
# call the .class method on the object and it correctlly returns Car.

puts "----------"

# Question 5: If we have a class AngryCat how do we create a new instance of this class?
# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

doe = AngryCat.new
doe.hiss

puts "----------"

# Question 5: Which of these two classes has an instance variable and how do you know?
# Answer: Pizza. The instance variable is designated by "@". You can also call the
# .instance_variables method on instances of Fruit and Pizza. (We would need to create
# the instnces as they are not created in the given code.)

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

cheese_pizza = Pizza.new('cheese')
apple = Fruit.new('apple')
p cheese_pizza.instance_variables
p apple.instance_variables

puts "----------"

# Question 6: What could we add to the class below to access the variable @volume?
# Answer: Technically nothing but not a good practice. The more accepted way is to add a
# "getter method" the getter method can be created from scratch or use the shorthand attr_*.

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

cube1 = Cube.new('loud')
p cube1.instance_variable_get("@volume")
p cube1.volume
p cube1.get_volume

puts "----------"

# Question 7: What is the default return value of `to_s` when invoked on an object? Where could
# you go to find out if you were unsure?
# Answer: Check Ruby docs if unsure. By default, the to_s method will return the name of the
# object's class and an encoding of the object id.

# Question 8: If we have a class as the one below, you can see in the make_one_year_older method
# we have used self. What does self refer to here?
# Answer: An instantiated object of class Cat.

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

kitty = Cat.new('tabby')
kitty.make_one_year_older
p kitty.age

puts "----------"

# Question 9: If we have a class such as the one below, in the name of the cats_count method
# we have used self. What does self refer to in this context?
# Answer: self refers to the class Cat.

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count
doe = Cat.new('wild')
p Cat.cats_count

puts "----------"

# Question 10: If we have the class below, what would you need to call to create a new instance
# of this class?
# Answer: `Bag.new`, but this would return an error because no arguments were passed. If you
# wanted to eliminate the error and wanted your new bag to have any "states" you could pass the
# arguments of color and material: shopping = Bag.new('brown', 'paper') If you wished to
# "capture" this new creation you'd need to store it somewhere such as a varible name:
# shopping = Bag.new('brown', 'paper')

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

shopping = Bag.new('brown', 'paper')