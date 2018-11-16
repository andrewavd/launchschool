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

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
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
    puts "The #{@model} ignition has been shut off."
  end

  def current_speed
    puts "The #{@model} is currently going #{@speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "The #{@model} has just returned from the paint shop and is now a beautiful #{color}."
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons} mpg"
  end

  def to_s
    "The #{year} #{color} #{@model} is amazing!"
  end
end

fiesta = MyCar.new('2016', 'white', 'Ford Fiesta')
puts fiesta
fiesta.speed_up(55)
fiesta.current_speed
fiesta.speed_up(20)
fiesta.current_speed
fiesta.brake(30)
fiesta.current_speed
fiesta.brake(40)
fiesta.current_speed
fiesta.shut_off
fiesta.current_speed
fiesta.spray_paint("mint green")
puts fiesta.year
MyCar.gas_mileage(100, 3)