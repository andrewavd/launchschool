def get_list()
  words = []
  while true
    print "Please enter a word ('enter' to quit): "
    (word = gets.chomp) == "" ? break: (words.push word)
  end
  return words
end

def sort_list(unsorted)
  sorted = [unsorted.pop]
  while unsorted.length > 0
    test = unsorted.pop
    if test.downcase > sorted[-1].downcase
      sorted.push(test)
    else
      sorted.each_with_index do |x, index|
        if test.downcase < x.downcase
          sorted.insert(index, test)
          break
        end
      end
    end
  end
  return sorted
end

def shuffle_list(words)
  shuffled = []

  while words.length > 0
    new_words = []
    test_index = rand(words.length)
    words.each_with_index do |x, index|
      if test_index == index
        shuffled.push(x)
      else
        new_words.push(x)
      end
    end
    words = new_words
  end
  return shuffled
end

=begin
def ShuffleList(words)
  words.sort_by{rand}
end
=end

original_list = get_list()
unsorted = original_list.clone
unshuffled = original_list.clone

if original_list == []
  puts "There is nothing to sort or shuffle!"
else
  puts "This is the original list: #{original_list}."
  puts "This is the sorted list: #{sort_list(unsorted)}."
  puts "This is the shuffled list: #{shufflelist(unshuffled)}."
end

# numbers to english words
def english_number(number)
  if number < 0
    return "Please enter a number zero or greater."
  end
  if number == 0
    return "zero"
  end

  num_string = ""
  ones_place = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  tens_place = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
  teenagers = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  
  left = number

  # trillions
  write = left/1000000000000
  left = left - write*1000000000000

  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + " trillion"
    if left > 0
      num_string = num_string + " "
    end
  end

  # billions
  write = left/1000000000
  left = left - write*1000000000

  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + " billion"
    if left > 0
      num_string = num_string + " "
    end
  end

  # millions
  write = left/1000000
  left = left - write*1000000

  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + " million"
    if left > 0
      num_string = num_string + " "
    end
  end

  write = left/1000
  left = left - write*1000

  if write > 0
    thousands = english_number(write)
    num_string = num_string + thousands + " thousand"
    if left > 0
      num_string = num_string + " "
    end
  end

  write = left/100
  left = left - write*100

  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + " hundred"
    if left > 0
      num_string = num_string + " "
    end
  end

  write = left/10
  left = left - write*10

  if write > 0
    if ((write == 1) && (left >0))
      num_string = num_string + teenagers[left-1]
      left = 0
    else
      num_string = num_string + tens_place[write-1]
    end
    if left > 0
      num_string = num_string + "-"
    end
  end

  write = left
  left = 0

  if write > 0
    num_string = num_string + ones_place[write-1]
  end
  num_string
end

puts english_number(0)
puts english_number(9)
puts english_number(10)
puts english_number(11)
puts english_number(17)
puts english_number(32)
puts english_number(88)
puts english_number(99)
puts english_number(100)
puts english_number(101)
puts english_number(234)
puts english_number(3211)
puts english_number(999999)
puts english_number(2432678)
puts english_number(17435983125)
puts english_number(1000000000000)

# Ninety nine bottles w/ english words
# 99 botles of beer on the wall
puts "How many bottles do you wish to start with?"
bottles = gets.chomp.to_i

#while bottles > 0
bottles.times do
  puts "#{english_number(bottles).capitalize} bottles of beer on the wall, #{english_number(bottles)} bottles of beer,"
  puts "take one down, pass it around, #{english_number(bottles - 1)} bottles of beer on the wall!"
  puts
  bottles -= 1
end