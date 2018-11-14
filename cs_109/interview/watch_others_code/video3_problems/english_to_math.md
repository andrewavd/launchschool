english_to_math.md
October 29, 2018

Problem:
Part #1
Write a method, computer, that takes a string as an argument and processes that string into a mathmatical equation returning the result of the equation.

Part #2
Make the method more robust. The method should be able to handle multiple operands (more than two) and multiple operators.

Breakdown/rules:
Problem type/structure: Iterate through string. Compare elements of iteration to a data structure to determine their non-english value and what they should do or be used for.
- (x) Convert string to array.
- () Iterate through array to obtain elements of equation and build equation from these elements.
- () Evaluate equation and return result.S

input: string
output/return: integer
data structures: Hash: "one" => 1

algorithm:
1. step 1
2. step 2

tests:
(x) All tests should evaluate to true.
Part #1
p computer("two plus two") == 4
p computer("seven minus six") == 1
p computer("zero plus 8") == 8
Part #2
p computer("two plus two minus three") == 1
p computer("three minus one plus five minus four plus six plus ten minus four") == 15

assessment/sandbox:
p computer("eight times four plus six divided by two minus two") == 33

```
def computer(str)
  nums = []
  operators = []

  equation_arr = str.split.delete_if { |e| e == 'by'}

  equation_arr.size.times do |i|
    i.even? ? nums << NUMBERS[equation_arr[i]] : operators << equation_arr[i]
  end

  # [8, 4, 6, 2, 2]
  # ["times", "plus", "divided", "minus"]

  if operators.include?('times') || operators.include?('divided')
    # build a new nums and operators
    operators.each_with_index do |op, i|
      if op == 'times'
        ordered_nums << nums[i] * nums[i+1]
        operators.unshift
      elsif op == 'divided'
        ordered_nums << nums[i] / nums[i+1]
        operators.unshift
      else


  result = nums[0]
  nums.size.times do |i|
    case operators[i]
    when 'plus'
      result = result + nums[i + 1]
    when 'minus'
      result = result - nums[i + 1]
    when 'times'
      result = result * nums[i + 1]
    when 'divided'
      result = result / nums[i + 1]
    end
  end
  result
end
```


Questions/assumptions:
- No tricks, all words in string are key words.
- numbers range is only 0 - 10
- initially we'll start with two operators: plus and minus.
- Equation format is: a number, an operator, a number. ONLY 3 COMPONENTS AT THIS STAGE.


Reflections:
Completion time:
