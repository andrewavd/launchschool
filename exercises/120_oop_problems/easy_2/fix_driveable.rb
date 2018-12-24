# fix_driveable.rb
# December 24, 2018

module Driveable
  def drive
  end
end

module Stoppable
  def self.stop
  end
end

class Car
  include Driveable
end

bobs_car = Car.new
bobs_car.drive

# Not sure why you would want to define a class method in a module but you could
# and you would access it just like any other class method.
Stoppable.stop
