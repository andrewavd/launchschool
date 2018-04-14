# Improved ask method

=begin
def ask(question)
  while true
    puts question
    answer = gets.chomp.downcase
    if (answer == 'yes' || answer == 'no')
      answer == 'yes' ? (return true) : (return false)
    else
      puts 'Please answer "yes" or "no".'
    end
  end
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
=end

# Old school Roman numerals

=begin
def roman_numeral(num)
  m = (num/1000)
  d = ((num%1000)/500)
  c = ((num%1000)%500)/100
  l = (((num%1000)%500)%100)/50
  x = ((((num%1000)%500)%100)%50)/10
  v = (((((num%1000)%500)%100)%50)%10)/5
  i = (((((num%1000)%500)%100)%50)%10)%5
  answer = ('M'*m) + ('D'*d) + ('C'*c) + ('L'*l) + ('X'*x) + ('V'*v) + ('I'*i)
end

flag = true

puts
puts 'This script converts an integer to a Roman numeral'
puts
while flag
  print 'Please enter an integer: '
  num = gets.chomp
  if (num.to_f.abs > num.to_i.abs) || num.to_i <= 0
    puts "#{num} is equivalent to \"nulla\" in Roman numerals! Good bye."
    flag = false    
  else
    num = num.to_i
    puts "#{num} is equivalent to #{roman_numeral(num)} in Roman numerals!"
  end
end
=end

# Roman numerals

def roman_numeral(num)
  thous = num/1000
  hunds = (num%1000)/100
  tens = (num%100)/10
  ones = (num%10)

  m = 'M' * thous
  if hunds == 4
    c = 'CD'
  elsif hunds == 9
    c = 'CM'
  else
    c = 'D' * ((num%1000)/500)
    c = c + ('C' * ((num%500)/100))
  end
  if tens == 4
    x = 'XL'
  elsif tens == 9
    x = 'XC'
  else
    x = 'L' * ((num%100)/50)
    x = x + ('X' * ((num%50)/10))
  end
  if ones == 4
    i = 'IV'
  elsif ones == 9
    i = 'IX'
  else
    i = 'V' * ((num%10)/5)
    i = i + ('I' * (num%5))
  end
  answer = "#{m}" + "#{c}" + "#{x}" + "#{i}"
end

flag = true

puts
puts 'This script converts an integer to a Roman numeral'
puts
while flag
  print 'Please enter an integer: '
  num = gets.chomp
  if (num.to_f.abs > num.to_i.abs) || num.to_i <= 0
    puts "#{num} is equivalent to \"nulla\" in Roman numerals! Good bye."
    flag = false    
  else
    num = num.to_i
    puts "#{num} is equivalent to #{roman_numeral(num)} in Roman numerals!"
  end
end