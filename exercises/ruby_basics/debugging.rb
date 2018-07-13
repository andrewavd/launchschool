# Reading Error Messages
# You come across the following code. What errors soes it raise for the given examples
# and what exactly do the error messages mean?
puts
puts "'Reading Error Messages'"
puts "----------------------"
puts

def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# examples
puts "My answer: too many arguments. Method is expecting 1 argument."
puts "Can be corrected by sending an array rather than series."
puts
puts find_first_nonzero_among([0, 0, 1, 0, 2, 0])
puts find_first_nonzero_among([1])

# Weather Forecast
# Out predict_weather method should putput a message indicating whether a sunny or cloudy day lies
# ahead, Howevr, the output is the same every time the method is invoked. Why? Fix the code so
# that it behaves as expected.
puts
puts "'Weather Forecast'"
puts "----------------------"
puts
puts "My answer: Original code was sampling strings which were being evaluated as such"
puts "by If statement. (Will always evaluate to true.) Remove quotes in sample so boolean"
puts "values are being evaluated by If."
puts

def predict_weather()
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

puts predict_weather()

# Multiply By Five
# When the user inuts 10, we wxpect the program to print "The result is 50!", but that's
# not the output we see. Why not?
puts
puts "'Multiply By Five'"
puts "----------------------"
puts

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "My answer: The original code was multiplying by a string, which is the type of the user input."
puts "By applying the method #to_i it the input the result is corrected."
puts "The result is #{multiply_by_five(number)}!"

# Pets
# Magdalena has just adopted a new pet! She wants to add ger new dog, Bowser, to the pets hash.
# After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed.
# Help Magdalena fix her code so that all three os her dogs' names will be associated with the
# key :dog in the pets hash.
puts
puts "'Pets'"
puts "----------------------"
puts

pets = {
  cat: 'fluffy',
  dog: ['sparky', 'fide'], 
  fish: 'oscar',
  }

#pets[:dog] = 'bowser' This is the original code. Bowser needed to be 'pushed' or 'shoveled' to the array.
pets[:dog] << 'bowser'

p pets

# Even Numbers
# We want to iterate through the numbers array and return a new array containing only the even
# numbers. However, our code isn't producing the xpected output. Why not? How can we change it
# to produce the expected result?
puts
puts "'Even Numbers'"
puts "----------------------"
puts

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select { |n| n.even? }

puts "My answer: The issue was using #map on numbers. Changed to #select method."
p even_numbers

# Confuciuis Says
# You want to  have a small script delivering motivational quotes, but with the
# following code you run into a very common wrror message: "no implicit conversion of nil
# into String (TypeError)." What is the problem and gow can you fix it?
puts
puts "'Confucius Says'"
puts "----------------------"
puts

def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts "My answer: The issue with the original code was that explicit returns were needed for"
puts "Yoda and Confucius because they were not the last statements evaluated. A solution is"
puts "to add explicit return(s)."
puts
puts 'Confucius says:'
puts "\"#{get_quote("Confucius")}\""
puts 'Yoda says:'
puts '"' + get_quote('Yoda') + '"'
puts 'Einstein says:'
puts "\"#{get_quote('Einstein')}\""

# Account Balance
# The putput of the code below tells you that you have around $70. However, you
# expected you bank account to  have about $238. What did we do wrong?
puts
puts "'Account Balance'"
puts "----------------------"
puts

balance = 0

january = {
  income: [1200, 75],
  expenses: [650, 140, 33.2, 100, 26.8, 78]
}

february = {
  income: [1200],
  expenses: [650, 140, 320, 46.7, 122.5]
}

march = {
  income: [1200, 10, 75],
  expenses: [650, 140, 350, 12, 59.9, 2.5]
}

def calculate_balance(month)
  plus = month[:income].sum
  minus = month[:expenses].sum
  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts "My answer: The balance wasn't being summed across all the months, only the balance for"
puts "March was being calculated. fix: change = to +=."
puts balance

# Colorful Things
# the following code throws an error. Find out what is wrong and think about how you would fix it.
puts
puts "'Colorful Things'"
puts "----------------------"
puts
puts "My answer: The nil to string error is caused by the break condition not being"
puts "'robust' enough. Both arrays need to be targeted (not just colors) and condition"
puts "needs to be changed to >=."

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= colors.length || i >= things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# Digit Product
# Given a String of digits, our digit_product method should return thr product of all digits
# in the String argument. You've been asked to implement this method without using reduce or inject.
puts
puts "'Digit Product'"
puts "----------------------"
puts
puts "My answer: No, I'm not surprised the answer is 'incorrectly' 0. The product variable is"
puts "initialized to 0 for a multiplication calculation! I initialized product with 1."

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end

p digit_product('12345')

# Warriors and Wizards
# We started writing an RPG game, but we already run into an error message. Find the problem and fix it.
puts
puts "'Wizards and Warriors'"
puts "----------------------"
puts
puts "My answer: There are two issues here. 1) When we get the character class from the user we"
puts "need to convert it to a symbol so we can work with it merging hashes. 2) merge returns a new"
puts "hash but we haven't done anything with it. Do we want player hash mutated or do we wish to"
puts "have the merged hashes assigned to player or a new variable? I mutated player using #merge!."
puts

player = {
  strength: 10,
  dexterity: 10,
  charisma: 10,
  stamina: 10
}

character_classes = {
  warrior: { strength: 20 },
  thief: { dexterity: 20 },
  scout: { stamina: 20 },
  mage: { charisma: 20 }
}

puts "Please type your class (warrior, thief, scout, mage):"
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts "Your character stats:"
puts player
