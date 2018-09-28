# 1000lights.rb
# You have a bank of switches before you numbered from 1 to n. Each switch is connected to exactly one
# light that is initially off. You walk sown the row of switches and toggle every one of them. You go
# back to the beginning and on this second pass you toggle switches 2, 4, 6 and so on. On the third
# pass you go back again to the beginning and toggle switches 3, 6, 9 and so on. You repeat this process
# and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches and returns an Array that
# identifies which lights are on after n repetions.

# n = the number of lights, as well as the number of passes you will make to toggle lights.
# The number of each pass: pass #1 = 1, pass #2 = 2, pass #3 = 3, represents the multiple of which
# switches will be toggled. Example(s): pass #1: switches 1 thru n will be toggled. pass #2: switches
# #2, #4, #6... (multiples of 2) will be toggled. pass #3: switches #3, #6, #9... (multiples of 3) and
# so on with pass #4: (multiples of 4), etc..

def create_light_bank(n)
  hsh = Hash.new
  1.upto(n) { |i| hsh[i] = false }
  hsh
end

def which_lights_on(hsh)
  hsh.select { |k, v| v == true }.keys
end

def output_light_status(arr, n)
  n == 1 ? light_s = 'light' : light_s = 'lights'
  puts "The bank of lights contains #{n} #{light_s}, of which the following lights are on:"
  if arr.size == 1
    puts "Light #{arr[0]} is on."
  else
    print "Lights "
    0.upto(arr.size - 3) { |i| print "#{arr[i]}, " }
    print "#{arr[-2]} and #{arr[-1]} are on.\n"
  end
  puts
end

def ident_lights_on(n)
  light_bank = create_light_bank(n)
  pass = 1
  loop do
    increment = pass
    loop do
      light_bank[increment] = !light_bank[increment]
      increment += pass
      break if increment > n
    end
    pass += 1
    break if pass > n
  end
  # which_lights_on(light_bank)
  output_light_status(which_lights_on(light_bank), n)
end

ident_lights_on(1)
ident_lights_on(2)
ident_lights_on(3)
ident_lights_on(4)
ident_lights_on(5)
ident_lights_on(10)
ident_lights_on(1000)