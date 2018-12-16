# comparing_names.rb
# December 16, 2018

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Maris'
person1.last_name = 'Holmes'
puts person1.first_equals_last?
puts person1.first_name
puts person1.last_name
