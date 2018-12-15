# counting_cats.#!/usr/bin/env ruby -wKU
# December 15, 2018

class Cat
  @@total_cats = 0

  def self.total
    puts @@total_cats
  end

  def initialize
    @@total_cats += 1
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
