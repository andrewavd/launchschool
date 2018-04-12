# Learn to Program - Second Edition : Chapter 9, by Chris Pine
# The following is content from chapter 9.
# The output is unlikely to make sense unless the code is being followed.

puts "The following output may not make much sense unless you are following along with the code."

=begin
while true
  puts 'Do you like eating tacos?'
  answer = gets.chomp.downcase
  if (answer == 'yes' || answer == 'no')
    break
  else
    puts 'Please answer "yes" or "no".'
  end
end

while true
  puts 'Do you like eating burritos?'
  answer = gets.chomp.downcase
  if (answer == 'yes' || answer == 'no')
    break
  else
    puts 'Please answer "yes" or "no".'
  end
end

while true
  puts 'Do you wet the bed?'
  answer = gets.chomp.downcase
  if (answer == 'yes' || answer == 'no')
    if answer == 'yes'
      wets_bed = true
    else
      wets_bed = false
    end
    break
  else
    puts 'Please answer "yes" or "no".'
  end
end

while true
  puts 'Do you like eating chimichangas?'
  answer = gets.chomp.downcase
  if (answer == 'yes' || answer == 'no')
    break
  else
    puts 'Please answer "yes" or "no".'
  end
end

puts 'Just a few more questions...'

while true
  puts 'Do you like eating sopapillas?'
  answer = gets.chomp.downcase
  if (answer == 'yes' || answer == 'no')
    break
  else
    puts 'Please answer "yes" or "no".'
  end
end

puts
puts "DEBRIEFING:"
puts 'Thank you for taking the time to help with'
puts 'this experiment. In fact, this experiment'
puts 'has nothing to do with Mexican food. It is'
puts 'an experiment about bed-wetting. The Mexican'
puts 'food was just there to catch you off guard'
puts 'in the hopes that you would answer more'
puts 'honestly. Thanks again.'
puts
puts "Bed wetting is an issue: " + wets_bed.to_s
=end

def say_moo (number_of_moos)
  puts 'mooooooo...' * number_of_moos
  'yellow submarine'
end

#say_moo
#say_moo
puts 'coin-coin'
#say_moo
say_moo(5)
puts 'oink-oink'
#say_moo()
#say_moo
x = say_moo(3)
puts x.capitalize + ', dude...'
puts x + '.'

def double_this(num)
  num_times_2 = num * 2
  puts num.to_s + ' doubled is ' + num_times_2.to_s + '.'
end

double_this(44)
#puts num_times_2.to_s

tough_var = "You can't even touch my variable!"

def little_pest(tough_var)
  tough_var = nil
  puts 'HAHA! I ruined your variable!'
end

little_pest(tough_var)
puts tough_var

return_val = puts 'This puts returned:'
puts return_val

def favorite_food(name)
  if name == 'Lister'
    return 'vindaloo'
  end
  if name == 'Rimmer'
    return 'mashed potatoes'
  end
  'hard to say...maybe fried plantain?'
end

def favorite_drink(name)
  if name == 'Jean-Luc'
    'tea, Earl Grey, hot'
  elsif name == 'Kathryn'
    'coffee, black'
  else
    'perhaps....horchata?'
  end
end

puts favorite_food('Rimmer')
puts favorite_food('Lister')
puts favorite_food('Cher')
puts favorite_drink('Kathryn')
puts favorite_drink('Oprah')
puts favorite_drink('Jean-Luc')

# Refactored psych questionaire

def ask(question)
  while true
    puts question
    answer = gets.chomp.downcase
    if (answer == 'yes' || answer == 'no')
      if answer == 'yes'
        wets_bed = true
      else
        wets_bed = false
      end
      break
    else
      puts 'Please answer "yes" or "no".'
    end
  end
  return wets_bed
end

ask('Do you like eating tacos?')
ask('Do you like eating burritos?')
wets_bed = ask('Do you wet the bed?')
ask('Do you like eating chimichangas?')
puts 'Just a few more questions...'
ask('Do you like eating sopapillas?')
ask('Do you like drinking horchata?')
ask('Do you like eating flautas?')
puts
puts "DEBRIEFING:"
puts 'Thank you for taking the time to help with'
puts 'this experiment. In fact, this experiment'
puts 'has nothing to do with Mexican food. It is'
puts 'an experiment about bed-wetting. The Mexican'
puts 'food was just there to catch you off guard'
puts 'in the hopes that you would answer more'
puts 'honestly. Thanks again.'
puts
puts "Bed wetting is an issue: " + wets_bed.to_s