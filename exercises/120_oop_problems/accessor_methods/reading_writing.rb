# reading_writing.rb
# December 16, 2018

# For demonstration, both the "built-in" and "manual" implementaions of
# getters & setters are presented. You would NOT use both in production.

class Person
  # built in
  attr_reader :name # getter
  attr_writer :name # setter

  # manual implementations of getter & setter

  # getter
  def name
    @name
  end

  # setter
  def name=(name)
    @name = name
  end
end

person1 = Person.new
person1.name = 'Maris'
# person1.name=('Maris')
puts person1.name
