# what_output.rb
# December 23, 2018

# Question:
# What output does this code print? Fix this class so that there are no surprises
# waiting in store for the unsuspecting geveloper.

# Answer:
# The question isn't very clear what "surprises" is referring to, is it desired
# for the instance variable to be upcased, is it desired for the instance variable
# to be assigned to the value of the string in the to_s method? In the end, the
# desired result is for the 'name' argument to be of type string, and for the
# instance variable '@name' to be upcased when puts is called on an object of type
# 'Pet'.

# The takeaway here is that the 'to_s' overriding of type 'Pet' is only applicable
# when 'puts' is called on objects of type 'Pet'.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    # @name.upcase!
    # "My name is #{@name}."
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name  # 'fluffy.name' is of type String, 'to_s' override not called.
puts fluffy       # fluffy is of type 'Pet' so the 'to_s' override is called.
puts fluffy.name  # 'fluffy.name' is of type String, 'to_s' override not called.
puts name         # 'name' is of type String, 'to_s' override not called.

puts

name = 42
fluffy = Pet.new(name)
puts fluffy.name   # type String
puts fluffy        # type Pet
puts fluffy.name   # type String
puts name          # type Integer
