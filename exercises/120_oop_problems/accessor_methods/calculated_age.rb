# calculated_age.rb
# December 16, 2018

class Person
  def age
    @age * 2
  end

  def age=(age)
    @age = age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age
