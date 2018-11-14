# dasherize_number.rb
# October 23, 2018

# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.

# Breakdown:
# input: integer return: string
# check each digit for:
#   - is it odd?
#   - is it first character in string? result << char << '-'.
#   - is it last character in string? and preceeding odd? result << char else: result << '-' << char
#   - is the preceeding character odd? '-' after only.

# Questions & assumptions:
# - argument is a number. Assumption: number means integer.
# - By odd, do we mean the digit itself or the digits index in the string? Answer: The digit itself.

def dasherize_number(num)
  result = ''
  work_str = num.to_s
  work_str.each_char.with_index do |char, i|
    if i > 0
      if char.to_i.odd? || work_str[i - 1].to_i.odd?
        result << '-'
      end
    end
    result << char
  end
  result
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #dasherize_number")
puts("===============================================")
    puts(
      'dasherize_number(203) == "20-3": ' +
      (dasherize_number(203) == '20-3').to_s
    )
    puts(
      'dasherize_number(303) == "3-0-3": ' +
      (dasherize_number(303) == '3-0-3').to_s
    )
    puts(
      'dasherize_number(333) == "3-3-3": ' +
      (dasherize_number(333) == '3-3-3').to_s
    )
    puts(
      'dasherize_number(3223) == "3-22-3": ' +
      (dasherize_number(3223) == '3-22-3').to_s
    )
puts("===============================================")