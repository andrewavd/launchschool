# grocery_list.rb
# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an
# array of the correct number of each fruit.

def buy_fruit(list)
  result = []
  list.each { |arr| arr[1].times { result << arr[0] } }
  result
end

def buy_fruit_solution(list)
  list.map { |fruit, quanity| [fruit] * quanity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) # == ["apples", "apples", "apples", "orange", "bananas","bananas"]
p buy_fruit_solution([["bananas", 5], ['mangos', 6], ['oranges', 12]])
