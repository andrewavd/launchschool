# good_dog.rb
# November 15, 2018

class GoodDog
  attr_accessor :name, :height, :weight

  #def initialize(name)
    #@name = name
  #end
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

# the getter and setter methods are no longer needed when using "attr_accessor"
  # def name              # renamed name from "get_name"
  #   @name
  # end

  # def name=(n)          # renamed name= from "set_name=(name)"
  #   @name = n
  #   end
    
  def speak
    #"#{@name} says arf!"
    "#{name} says Arf!" # We are now calling the instance method rather than the instance variable.
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name}, weighs #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
puts sparky.speak
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info