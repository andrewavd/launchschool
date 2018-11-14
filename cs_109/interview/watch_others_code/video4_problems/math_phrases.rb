# math_phrases.rb
# October 31, 2018

NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

def mathphrase(num)
  english_phrase = []
  english_phrase << NUMBERS.shuffle[-1]
  num.times { english_phrase << OPERATORS.shuffle[-1] << NUMBERS.shuffle[-1] }
  english_phrase.join(' ').gsub('divided', 'divided by')
end

p mathphrase(rand(10)+1) #=> "five minus two"
p mathphrase(rand(10)+1) #=> "two plus three times eight"
p mathphrase(rand(10)+1) #=> "one divided by three plus five times zero"