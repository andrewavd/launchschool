class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # def name
  #   @name
  # end
end

andy = Person.new("Andy")
puts andy.name