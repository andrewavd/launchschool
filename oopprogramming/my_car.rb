# my_car.rb
# November 15, 2018

# Problem:
# Create a class called MyCar. When you initialize a new instance or object of the class, allow the
# user to define some instance variables that tell us the year, color, and model of the car. Create
# an instance variable that is set to 0 during instantiation of the object to track the current speed
# of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

# Add an accessor method to your MyCar class to change and view the color of your car. Then add an 
# accessor method that allows you to view, but not modify, the year of your car.

# You want to create a nice interface that allows you to accurately describe the action you want your
# program to perform. Create a method called spray_paint that can be called on an object and will modify
# the color of the car.

# Add a class method to your MyCar class that calculates the gas mileage of any car.

# INHERITANCE EXERCISES:
# 1)
# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that 
# isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores
# information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant
# defined that separates it from the MyCar class in some way.

# 2)
# Add a class variable to your superclass that can keep track of the number of objects created that
# inherit from the superclass. Create a method to print out the value of this class variable as well.

# 3)
# Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to
# that subclass.

# 4)
# Print to the screen your method lookup for the classes that you have created.

# 6)
# Write a method called age that calls a private method to calculate the age of the vehicle. Make sure
# the private method is not available from outside of the class. You'll need to use Ruby's built-in
# Time class to help.

module TowCapacity
  TOW_CAPACITY = 3000

  def tow_margin(weight)
    @safe_margin = TOW_CAPACITY - weight
    if @safe_margin >= 0
      puts "GREEN LIGHT! You are #{@safe_margin} lbs under capacity."
    else
      puts "WARNING! You are #{@safe_margin.abs} lbs to heavy."
    end
  end
end

class Vehicle
  @@vehicles_built = 0

  attr_accessor :color
  attr_reader :year, :model

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    @@vehicles_built += 1
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and slow down #{number} mph."
  end

  def shut_off
    @speed = 0
    puts "The #{model} ignition has been shut off."
  end

  def current_speed
    puts "The #{model} is currently going #{@speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "The #{model} has just returned from the paint shop and is now a beautiful #{color}."
  end

  def age
    puts "The #{model} is #{vehicle_age} years old."
  end

  def self.num_vehicles_built
    puts "#{@@vehicles_built} new vehicles were built."
  end

  def to_s
    "The #{year} #{color} #{model} is amazing!"
  end

  private

  def vehicle_age
    Time.new.year - year.to_i
  end
end

class MyCar < Vehicle
  RATED_MPG = 35

  def self.gas_mileage(gallons)
    puts "#{RATED_MPG * gallons} estimated miles until empty."
  end
end

class MyTruck < Vehicle
  include TowCapacity

  RATED_MPG = 18
end

# puts "--- Vehicle method path ---"
# puts Vehicle.ancestors
# puts "--- MyCar method path ---"
# puts MyCar.ancestors
# puts "--- MyTruck method path ---"
# puts MyTruck.ancestors

fiesta = MyCar.new('2016', 'white', 'Ford Fiesta')
f150 = MyTruck.new('2018', 'black', 'Ford F150')
ram = MyTruck.new('2017', 'purple', 'Dodge Ram')
puts fiesta
puts f150
puts ram
ram.age
fiesta.age
# ram.tow_margin(2500)
# ram.tow_margin(3500)
# Vehicle.num_vehicles_built

# fiesta.speed_up(55)
# fiesta.current_speed
# fiesta.speed_up(20)
# fiesta.current_speed
# fiesta.brake(30)
# fiesta.current_speed
# fiesta.brake(40)
# fiesta.current_speed
# fiesta.shut_off
# fiesta.current_speed
# fiesta.spray_paint("mint green")
# puts fiesta.year
# MyCar.gas_mileage(100, 3)