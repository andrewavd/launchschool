# car_loan_calculator.rb

def prompt(message)
  print("=> #{message}")
end

def valid_float?(num)
  num.to_f.to_s == num
end

def valid_int?(num)
  num.to_i.to_s == num
end

def invalid_duration_type?(operation)
  !%w(m month months y year years).include?(operation)
end

def obtain_loan_specs(loan_parameter)
  loan_spec = ''
  valid_input = false
  until valid_input
    loan_spec = gets.chomp()
    if loan_spec.to_i < 0
      prompt("Invalid, #{loan_parameter} can't be negative - Please re-enter: ")
    elsif valid_float?(loan_spec) || valid_int?(loan_spec)
      valid_input = true
    else
      prompt("'#{loan_spec}' invalid #{loan_parameter} - Please re-enter: ")
    end
  end
  loan_spec
end

def calculate_loan(loan_amt, apr, duration)
  if apr == 0
    loan_amt / duration
  else
    loan_amt * (apr / (1 - (1 + apr)**-duration))
  end
end

terminate_calculator = false

puts("Welcome to the loan calculator")

until terminate_calculator
  prompt("Enter amount of loan: ")
  loan_amount = obtain_loan_specs('loan amount').to_f

  prompt("Enter the annual percentage rate: ")
  apr = obtain_loan_specs('annual percentage rate').to_f / 100
  monthly_apr = apr / 12

  prompt('Would you prefer loan length to be (M)onths or (Y)ears? ')
  duration_units = ''
  valid_duration = false
  until valid_duration
    duration_units = gets.chomp().downcase
    if invalid_duration_type?(duration_units)
      prompt("Must choose (M)onths or (Y)ears: ")
    else
      valid_duration = true
    end
  end

  duration_units = if duration_units.start_with?('m')
                     'months'
                   else
                     'years'
                   end
  prompt("Enter loan length (#{duration_units}): ")

  loan_duration_months = obtain_loan_specs('loan duration').to_i
  if duration_units.start_with?('y')
    loan_duration_months *= 12
  end

  loan_payment = calculate_loan(loan_amount, monthly_apr, loan_duration_months)
  puts("Your monthly loan payment is: $#{format('%02.2f', loan_payment)}")

  prompt("Would you like to calculate another loan (Y/n)?")
  perform_another = gets.chomp()
  terminate_calculator = true if !perform_another.downcase.start_with?('y')
end

puts("Thank you for using the loan calculator... Good bye.")
