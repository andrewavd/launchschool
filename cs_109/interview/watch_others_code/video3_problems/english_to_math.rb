# english_to_math.rb
# October 29, 2018

NUMBERS = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "ten" => 10
}
# Part 1
=begin
OPERATORS = {
  'plus' => :+,
  'minus' => :-
}
=end

def computer(str)
  nums = []
  ordered_nums = []
  
  equation_arr = str.split.delete_if { |e| e == 'by'}

  equation_arr.size.times do |i|
    # i.even? ? nums << NUMBERS[equation_arr[i]] : operators << equation_arr[i]
    i.even? ? nums << NUMBERS[equation_arr[i]] : nums << equation_arr[i]
  end

  answer = nums[0]
  (1..nums.size - 1).step(2) do |i|
    if nums[i] == 'times'
      #answer = nums[i-1] * nums[i+1]
      answer = answer * nums[i+1]
    elsif nums[i] == 'divided'
      #answer = nums[i-1] / nums[i+1]
      answer = answer / nums[i+1]
    else
      ordered_nums << answer
      ordered_nums << nums[i]
      answer = nums[i + 1]
    end
  end
  ordered_nums << nums[-1]

  if !nums.include?('plus') || !nums.include?('minus')
    p answer
    return answer
  end



  # Part 1 refactor:
  #nums << NUMBERS[equation_arr[0]]
  #operator = OPERATORS[equation_arr[1]]
  #nums << NUMBERS[equation_arr[2]]

  # Part 1 first try:
  #NUMBERS.each { |k, v| nums << v if k == equation_arr[0] }
  #OPERATORS.each { |k, v| operator = v if k == equation_arr[1] }
  #NUMBERS.each { |k, v| nums << v if k == equation_arr[2] }

  # part 1
  #nums.inject(operator)

  # Part 2
=begin
  result = nums[0]
  nums.size.times do |i|
    case #operators[i]
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
=end

result = ordered_nums[0]
#ordered_nums.size.times do |i|
(0..ordered_nums.size - 1).step(2) do |i|
  case ordered_nums[i+1]
  when 'plus'
    result = result + ordered_nums[i + 2]
  when 'minus'
    result = result - ordered_nums[i + 2]
  end
end
p result
end


# All output will be "true" if all tests are passed.
# Part 1
#p computer("two plus two") == 4
#p computer("seven minus six") == 1
#p computer("zero plus eight") == 8
# Part 2
#p computer("two plus two minus three") == 1
#p computer("three minus one plus five minus four plus six plus ten minus four") == 15
# Part 3 Doesn't respect order of operation
#p computer("eight times four plus six divided by two minus two") == 17
#p computer("one plus four times two minus two") == 8
#p computer("nine divided by three times six") == 18
# Part 4 Respects order of operation
p computer("eight times four plus six divided by two minus two") == 33
p computer("one plus four times two minus two") == 7
p computer("nine divided by three times six") == 18
p computer("seven plus four divided by two") == 9
p computer("seven times four plus one divided by three minus two") == 26
p computer("one plus four times three divided by two minus two") == 5
