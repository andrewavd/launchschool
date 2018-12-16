# towable_1.rb
# December 16, 2018

module Towable
  def tow
    puts "I can tow a trailer!"
  end
end

class Truck
  include Towable
end

class Car; end

truck1 = Truck.new
truck1.tow
