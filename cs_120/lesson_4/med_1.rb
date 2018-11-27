# med_1.rb
# November 26, 2018

# Question 1: Ben asked Alyssa to code review the following code. Alyssa glanced over the code
# quickly and said - "It looks fine, except that you forgot to put the `@` before `balance`
# when you refer to the balance instance variable in tghe bodey of the `positive_balance?`
# method." "Not so fast", Ben replied. "What I'm doing hereis valid - I'm not missing an `@`!"
# Who is right, Ben or Alyssa, and why?
# Answer: Ben is correct. `balance` in the `positive_balance?` method is not referencing an
# instance variable directly but by making a call to the getter method named `balance` that was
# created by `attr_accessor`.

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Question 2: Alyssa created the following code to keep track of items for a shopping cart
# application she's writing. Alan looked at the code and spotted a mistake. "This will fail
# when `update_quanity` is called", he says. Can you spot the mistake and how to address it?
# Answer: There is no way to reassign a value to `quantity`. A getter method has been created
# but no setter method for `quantity`, so when `update quantity` is called the original value
# of 5 assigned during initialization will be returned. Also, to assign the `updated_count`
# value the setter method must be called using `self.quantity`.

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set.
    @quantity = updated_count if updated_count >= 0
  end
end

puts "Question 2"

freddy = InvoiceEntry.new("widgets", 5)
p freddy.product_name
freddy.update_quantity(10)
p freddy.quantity

puts "----------"

# Question 3: Pertaining to Question 2, is there anything wrong with the "fic"?
# Answer: Nothing incorrect syntactically. However, you are altering the public interfaces of
# the class. In other words, you are now allowing clients of the class to change the quantity
# directly (calling the accessor with the instance.quantity = <new value> notation) rather than
# by going through the update_quantity method. It means that the protections built into the
# update_quantity method can be circumvented and potentially pose problems down the line.

# Question 4: Let's practice creating an object hierarchy.

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def  hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

puts "Question 4"

greet = Greeting.new
hi = Hello.new
bye = Goodbye.new
greet.greet("atlas")
hi.hi
bye.bye

puts "----------"

# Question 5: Given the following, write additional code for `KrispyKreme` such that the
# `puts` statements will  work as specified.

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts "Question 5"

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

# Question 6: If we have these two methods, what is the difference in the way the code works?
# Answer: There is no difference in the result.
# The first class uses the instance variable for assignment and a getter method for access
# to that instance variable. Notice how the getter method call does not require the use of
# self. This means the use of self in the second class is un-neccessary. Also, the attr_accessor
# method could be changed to attr_reader becuase assignment is not utilizing the short hand
# setter method call, it is assigning directly to the instance variable

# The second class is utilizing short hand for assignment. Calling the short hand setter
# requires the use of self. As noted above, accessing the short hand getter does not require
# the use of self.

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# pc = Computer.new
# pc.create_template
# p pc.show_template

# Question 7: How could you change the method name beow so that the method name is more clear
# and less repetitive?
# Answer: You don't need to use "light" in "light_information". Since the name of the class is
# "Light", and this is a class method, the word "light" becomes repetitive in the call. As
# an example: Light.light_information is the current call but would become Light.information
# This reads much better.
