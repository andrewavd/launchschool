# fix_flightdata.rb
# December 23, 2018

# Again, the intent of the code is somewhat ambiguous here and the problem's
# instructions didn't clarify. Having the ability to 'read' the flight number
# made sense to me, having the ability to change the value of the @database_handle
# instance variable was something I was unsure about so I removed that ability.

class Flight
  # attr_accessor :database_handle
  attr_reader :flight_number

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
