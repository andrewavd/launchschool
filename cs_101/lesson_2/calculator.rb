# command line calculator
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.print("=> #{message}")
end

def valid_number?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end

def invalid_name?(user_name)
  user_name.empty?()
end

def invalid_operator?(operation)
  !%w(a add s subtract m multiply d divide).include?(operation)
end

def obtain_num_input
  valid_input = false
  num = ''
  until valid_input
    num = Kernel.gets().chomp()
    if valid_number?(num)
      valid_input = true
    else
      Kernel.puts('That is not a valid input.')
    end
  end
  num
end

def operation_confirm(operator)
  case operator
  when "a", "add"
    "ADDITION"
  when "s", "subtract"
    "SUBTRACTION"
  when "m", "multiply"
    "MULTIPLICATION"
  when "d", "divide"
    "DIVISION"
  end
end

# prompt("Welcome to the calculator! Please enter your name: ")
prompt(MESSAGES['welcome'])
valid_name = false
until valid_name
  user_name = Kernel.gets().chomp().capitalize()
  if invalid_name?(user_name)
    # Kernel.puts('Please enter a name.')
    Kernel.puts(MESSAGES['valid_name'])
  else
    valid_name = true
  end
end

Kernel.puts("Hi #{user_name},")

terminate_calculator = false
until terminate_calculator
  prompt("Please enter your first number: ")
  num1 = obtain_num_input().to_f
  prompt("Please enter your second number: ")
  num2 = obtain_num_input().to_f

  operation_prompt = <<-MSG
  Available operations:
    (A)dd
    (S)ubtract
    (M)ultiply
    (D)ivide
  MSG

  Kernel.puts(operation_prompt)
  prompt('Please choose an operation: ')
  valid_operator = false
  until valid_operator
    operator = Kernel.gets().chomp().downcase()
    if invalid_operator?(operator)
      Kernel.puts('Must choose (A)dd, (S)ubtract, (M)ultiply, (D)ivide.')
    else
      valid_operator = true
    end
  end

  puts("#{operation_confirm(operator).upcase} chosen operation.")

  case operator.downcase()
  when "a", "add"
    Kernel.puts("#{num1} + #{num2} = #{num1 + num2}")
  when "s", "subtract"
    Kernel.puts("#{num1} - #{num2} = #{num1 - num2}")
  when "m", "multiply"
    Kernel.puts("#{num1} * #{num2} = #{num1 * num2}")
  when "d", "divide"
    Kernel.puts("#{num1} / #{num2} = #{num1 / num2}")
  end

  prompt("Perform another calculation (Y/N)? ")
  perform_another = Kernel.gets().chomp()
  terminate_calculator = true if !perform_another.downcase().start_with?('y')
end

Kernel.puts("Thank you for using the calculator #{user_name} ... Good bye.")
