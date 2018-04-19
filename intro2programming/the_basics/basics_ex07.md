SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

The above error message indicates that a right parenthesis was used where Ruby was expecting a right bracket.
Based on what we have learned so far this would probably suggest looking at where a closing "bracket" on a hash belongs and see if there is a parenthesis located there or in the code that follows.

example_hash = {
    :key_1 => 'one',
    :key_2 => 'two',
    :key_3 => 'three',
) <------THIS IS WRONG AS A CLOSING HASH BRACKET

puts "Something"