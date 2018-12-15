# colorful_cat.#!/usr/bin/env ruby -wKU
# December 15, 2018

class Cat
  attr_reader :name
  
  COLOR = 'tan'

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
