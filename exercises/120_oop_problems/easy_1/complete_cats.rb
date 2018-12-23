# complete_cats.rb
# December 23, 2018

class Pet
  attr_accessor :age, :color
  attr_reader :name

  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end
end

  class Cat < Pet
    def to_s
      "My cat #{name} is #{age} years old and has #{color} fur."
    end
  end

  pudding = Cat.new('Pudding', 7, 'black and white')
  butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
  doe = Cat.new('Doe', 3, 'tan, brown, orange, white and black')
  puts pudding, butterscotch, doe
