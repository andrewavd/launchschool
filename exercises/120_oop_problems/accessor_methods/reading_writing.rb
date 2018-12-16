# reading_writing.rb
# December 16, 2018

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Maris'
puts person1.name
