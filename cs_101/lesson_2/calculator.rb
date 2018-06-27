# Buils a command line calculator program that does the following:
# 1) asks for two numbers
# 2) asks for the type of operation to perform: add, subtract, multiply or divide
# 3) displays the result

Kernel.puts("Welcome to the basic calculator")
Kernel.print("Please enter your first number: ")
num_1 = Kernel.gets().chomp().to_f()
Kernel.print "Please enter your second number: "
num_2 = Kernel.gets().chomp().to_f()

Kernel.print "What would you like to do (add, subtract, multiply, divide)? "
operation = Kernel.gets().chomp()

case operation.downcase
  when "add"
    Kernel.puts("#{num_1} + #{num_2} = #{num_1 + num_2}")
  when "subtract"
    Kernel.puts("#{num_1} - #{num_2} = #{num_1 - num_2}")
  when "multiply"
    Kernel.puts("#{num_1} * #{num_2} = #{num_1 * num_2}")
  when "divide"
    Kernel.puts("#{num_1} / #{num_2} = #{num_1 / num_2}")           
  else
    Kernel.puts("Invalid choice")
end