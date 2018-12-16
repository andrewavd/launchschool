# lookup_1.rb
# December 16, 2018

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
p cat1.color

puts "--- Method Lookup Path ---"
# Cat -> Animal
# Class#ancetors will return an array containing the names of the classes that make up
# the COMPLETE method lookup path. It is important to understand that Ruby will stop
# traversing the lookup path upon finding the target method in Class#Animal.
puts Cat.ancestors
