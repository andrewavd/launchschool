# what_will_do.rb
# December 24, 2018

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata  # => 'ByeBye'
puts thing.dupdata      # => 'HelloHello'
