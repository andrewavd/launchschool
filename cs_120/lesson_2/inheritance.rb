# inheritance.rb
# November 19, 2018

# Lesson 2:Object Oriented Progeamming
# Lecture: Inheritance

# General Problem:
# Class based inheritance works great when it's used to model hierarchical domains. Let's take a look
# at a few practice problems. Suppose we're building a software system for a pet hotel business, so our
# classes deal with pets.

# 1
# Given the base class:
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

# One problem is that we need to keep track of different breeds of dogs, since they have slightly
# differentt behaviors. For example, bulldogs can't swim, but all other dogs can.
# Create a sub-class from `Dog` called `Bulldog` overriding the `swim` method to return "can't swim!"

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
freddy = BullDog.new
puts teddy.speak
puts teddy.swim
puts freddy.speak
puts freddy.swim

puts "----"

# 2
# Let's create a few more methods for our `Dog` class.
# Create a new class called `Cat`, which can do everything a dog can, except swim or fetch. Assume the
# methods do the exact same thing.

class Pet
  def speak
    "I really don't know what to say!"
  end

  def run
    'running'
  end

  def jump
    'jumping'
  end
end

class Dog2 < Pet
  def speak
    'bark'
  end

  def swim
    'swimming'
  end

  def fetch
    'fetching'
  end
end

class Bulldog < Dog2
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end

  def fetch
    "No! fetch it yourself!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run
puts pete.speak

puts kitty.run
puts kitty.speak
puts kitty.fetch

puts dave.speak

puts bud.run
puts bud.swim
puts bud.speak