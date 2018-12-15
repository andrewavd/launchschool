# private_secret.rb
# December 15, 2018

class Person
  attr_writer :secret

  def share_secret
    puts secret
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret
# Won't work because we're calling a private method.
# p person1.secret
