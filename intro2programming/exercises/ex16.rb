# May 15, 2018
# Take the given array and turn it into a new array that consosts of strings containing
# one word.

a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |x| x.split(' ')}.flatten!

p a
