# reversed_arrays2.rb

def reverse_array(list)
  reversed_list = []
  list.size.times { reversed_list << list.pop }
  reversed_list
end

p reverse_array([1, 2, 3, 4])
p reverse_array(%w(a b c d e))
p reverse_array(['abc'])
p reverse_array([])