# right_triangles.rb

def triangle(n)
  count = 1
  n.times do
    puts("#{' ' * (n-count)}#{'*' * count}")
    count += 1
  end
end

triangle(5)
triangle(9)
triangle(20)