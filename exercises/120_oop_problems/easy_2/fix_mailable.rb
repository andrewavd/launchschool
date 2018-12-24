# fix_mailable.rb
# December 24, 2018

module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_accessor :name, :address, :city, :state, :zipcode

  def initialize(name, address, city, state, zip)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zip
  end
end

class Employee
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode

  def initialize(name, address, city, state, zip)
    @name = name
    @address = address
    @city = city
    @state = state
    @zipcode = zip
  end
end

betty = Customer.new('Betty Johansson', '5258 Rishley Run Way', 'Mount Dora', 'FL', '32756')
betty.print_address
betty.name = 'Betty White Johansson'
bob = Employee.new('Andrew Holmes', '33616 Campeon Ct', 'Sorrento', 'FL', '32776')
betty.print_address
bob.print_address
