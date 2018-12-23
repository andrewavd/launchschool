# refactoring_vehicles.rb
# December 23, 2018

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_accessor :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    super + " #{payload}"
  end
end

personal_car = Car.new('Ford', 'Fiesta')
puts personal_car

harley = Motorcycle.new('Harley', 'Super Glide')
puts harley

work_truck = Truck.new('Chevy', '1500', '3000 lbs')
puts work_truck
puts work_truck.wheels
