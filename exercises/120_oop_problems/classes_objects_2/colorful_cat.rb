# colorful_cat.#!/usr/bin/env ruby -wKU
# December 15, 2018

class Cat
  # The getter method is not needed in this case because name is not being exposed
  # outside the instance. If the getter is used it is a preferred practice to change
  # @name in the greet method to name.

  # attr_reader :name

  COLOR = 'tan'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
