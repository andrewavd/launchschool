# welcome_stranger.rb
# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that , when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title.

def greetings(arr, hsh)
  "Congratulations #{arr.join(' ')}, \
  3 time #{hsh[:title]} #{hsh[:occupation]} of the year!"
end

puts greetings(['Andy', 'Holmes'], { title: "Software", occupation: "Engineer" })
