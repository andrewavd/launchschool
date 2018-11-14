# time_conversion.rb
# October 22, 2018

# Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.

def time_conversion(minutes)
  time = minutes.divmod(60)
  result = time[0].to_s + ':' + time[1].to_s
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #time_conversion")
puts("===============================================")
    puts('time_conversion(15) == "0:15": ' + (time_conversion(15) == '0:15').to_s)
    puts('time_conversion(150) == "2:30": ' + (time_conversion(150) == '2:30').to_s)
    puts('time_conversion(360) == "6:00": ' + (time_conversion(360) == '6:00').to_s)
puts("===============================================")