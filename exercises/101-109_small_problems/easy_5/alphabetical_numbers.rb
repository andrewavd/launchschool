# alphabetical_numbers.rb
# Description: Write a method that takes an Array of Integers between 0 and 19, and returns an Array
# of those Integers sorted based on the English words for each number.


# 1) Breakdown Problem:
# > Write a method.
# > Method returns array of input integers SORTED by their english spelling.
# >
# >
# >

# 2) Input:
# > Array of integers BETWEEN 0 and 19.
# >
# >

# 3) Output:
# > Array of integers sorted by their english spelling.
# >
# >

# 4) Questions:
# > Are 0 and 19 included?
# >

NUMS_WORDS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(arr)
  sorted_nums = NUMS_WORDS.sort_by { |key, value| value }
  sorted_nums.map { |hsh| hsh[0] }
end

p alphabetic_number_sort((0..19).to_a) # ==> [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]