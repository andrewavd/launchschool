# choose_right_method.rb
# December 16, 2018

class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = 'Maris'
person1.phone_number = '0123456789'
puts person1.name
