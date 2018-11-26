# easy_2.rb
# November 26, 2018

# Question 1: You are given the following code. What is the result of the given method call?
# Answer: "You will (one of the strings from the array in the choices method)"

class Oracle
  def pridict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
p oracle.pridict_the_future

puts "----------"

# Question 2: Different code, same question as in Q1.
# Answer: You will (from the choices method in class Roadtrip)

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class Roadtrip < Oracle
  def choices
    ["visit Vegas", "fly to fiji", "romp in Rome"]
  end
end

trip = Roadtrip.new
p trip.predict_the_future

puts "----------"

# Question 3: How do you find where Ruby will liik for a method when that method is called?
# How can you fin an object's ancestors?
# Answer: The "method lookup path" is the hierarchy thru which Ruby traverses to find a method
# when it is called. Call the .ancestors method to list a classes ancestors. The order of the
# elements in the list is the order of the chain Ruby will traverse.

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class Hotsauce
  include Taste
end

p Hotsauce.ancestors

puts "----------"

# Question 4: What could you add to this class to simplify it and remove two methods from the 
# class difinition while still maintaining the same functionality?
# Answer: See comments below

class BeesWax
  # add the 'shorthand' getter/setter methods
  attr_accessor :type

  def initialize(type)
    @type = type
  end

# remove the 'longhand' getter and setter methods
  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

# we don't need to access the instance variable with @type, we can access the getter method.
  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

# Question 6: If I have the following class, which one of these is a class method (if any)
# and how do you know? How would you call a class method?
# Answer: The class method is self.manufacturer because it is defined using `self`. To call:
# Television.manufacturer

class Television
  def self.manufacturer # this is a class method
    puts "RCA"
  end

  def model
    # method logic
  end
end

Television.manufacturer

puts "----------"

# Question 7: If we have a class such as the one below, explain what the `@@cats_count`
# variable does and how it works. What code would you  need to write to test your theory?
# Answer: @@cats_count is a class variable that is keeping track of how many instances of
# the Cat class are created. To verify, we could call the class method `cats_count` after
# each new instance is created. (see below)

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
doe = Cat.new('attack')
p Cat.cats_count

puts "----------"

# Question 8: If we have the following classes, can we add to the `Bingo` class to allow it
# to inherit the `play` method from the `Game` class?
# Answer: Yes. class Bingo < game

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end
end

high_stakes = Bingo.new
p high_stakes.play

puts "----------"

# Question 9: What would happen if we added a play method to the `Bingo` class, keeping
# in mind that there is already a method of this name in the `Game` clss that the `Bingo`
# class inherits from.
# Answer: The play method in the Bingo class would be executed because it is first in the
# lookup path.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end

  def play
    "B-9, does anyone have B-9?"
  end
end

high_stakes = Bingo.new
p high_stakes.play

# Question 10: What are the benefits of using OOP in Ruby?
# 1. Creating objects allows programmers to think more abstractly about the code they are writing.
# 2. Objects are represented by nouns so are easier to conceptualize.
# 3. It allows us to only expose functionality to the parts of code that need it, meaning
#    namespace issues are much harder to com across.
# 4. It allows us to easily give functionality t different parts of an application without
#    duplication.
# 5. We can build applications faster as we can reuse pre-written code.
# 6. As the software becomes more complex this complexity can be more easily managed.
