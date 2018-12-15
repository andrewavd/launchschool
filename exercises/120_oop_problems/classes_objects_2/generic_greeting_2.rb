# generic_greeting_2.#!/usr/bin/env ruby -wKU
# December 15, 2018

class Cat
  attr_reader :name

  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hello, my name is #{name}!"
  end
end

  kitty = Cat.new('Sophie')

  Cat.generic_greeting
  kitty.personal_greeting
