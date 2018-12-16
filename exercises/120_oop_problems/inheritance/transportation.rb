# transportation.rb
# December 16, 2018

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

silverado = Transportation::Truck.new
fiesta = Transportation::Car.new
p fiesta
