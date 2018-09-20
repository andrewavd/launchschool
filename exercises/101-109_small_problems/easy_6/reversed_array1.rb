# reversed_arrays1.rb

def reverse_array!(list)
  hold = []
  list.size.times do
    hold << list.pop
  end
  hold.size.times do
    list << hold.shift
  end
  list
end

p reverse_array!([1, 2, 3, 4])
p reverse_array!(%w(a b c d e))
p reverse_array!(['abc'])
p reverse_array!([])