# create_object.rb
# November 14, 2018

# Problem:
# How do we create an object in Ruby? Give an example of  the creation of an object.
# What is a module? What is its purpose? How do we use them with our classes? Create a module for
# the class you created in exercise 1 and include it properly.

# A module is another way to achieve polymorphism. A module is a collection of behaviors that is 
# useable in other classes via `mixins`. A module is "mixed in" to a class usint the `include`
# method invocation. It's purpose is to provide re-usability of "behaviors" to multiple classes.

module Move
  def move(movement)
    puts "moving #{movement}"
  end
end

class Automobile
  include Move
end

my_car = Automobile.new
my_car.move("forward")
my_car.move("backward")