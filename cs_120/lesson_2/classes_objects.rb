# classes_objects.rb
# November 19, 2018

# 1
# Given the below usage of the `Person` class, code the class definition.
class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

bob = Person.new('bob')
puts bob.name
bob.name = 'Robert'
puts bob.name

puts "----"

# 2
# Modify the class definition from above to facilitate the following methods. (first_name, last_name)
class Person2
  attr_accessor :first_name, :last_name

  def initialize(name)
    name_parts = name.split
    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts.last : ''
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person2.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Holmes'
puts bob.name

puts "----"

# 3
# Now create a smart `name=` method that can take just a first name or a full name, and knows how to 
# set the `first_name` and `last_name` appropriately.

class Person3
  attr_accessor :first_name, :last_name

  def initialize(name)
    create_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    create_full_name(name)
  end

  private

  def create_full_name(name)
    name_parts = name.split
    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts.last : ''
  end
end

bob = Person3.new('Robert')
puts bob.name
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name

bob.name = "Andy Holmes"
puts bob.first_name
puts bob.last_name
puts bob.name

puts "----"

# 4
# Using the class definition from step 3, let's create a few more people; that is, `Person` objects.

bob = Person3.new('Robert Smith')
rob = Person3.new('Robert Smith')
p bob.name == rob.name

puts "----"

# 5
#
class Person4
  attr_accessor :first_name, :last_name

  def initialize(name)
    create_full_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    create_full_name(name)
  end

  def to_s
    name
  end

  private

  def create_full_name(name)
    name_parts = name.split
    @first_name = name_parts.first
    @last_name = name_parts.size > 1 ? name_parts.last : ''
  end
end
bob = Person3.new('Andrew Holmes')
puts "The person's name is: #{bob}."
bob = Person4.new('Robert Holmes')
puts "The persons name is: #{bob}."