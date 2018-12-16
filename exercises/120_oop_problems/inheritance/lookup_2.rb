# lookup_2.rb
# December 16, 2018

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color # will throw an error because color is undefined.

# Cat --> Animal --> Object --> Kernel -- BasicObject
puts "--- Method Lookup Path ---"
puts Cat.ancestors
