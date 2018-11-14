# sum_or_product.rb
# October 29, 2018

def apply_op(num, op)
  if op == 'sum'
    #result = 0
    #(1..num).each { |n| result += n }
    (1..num).inject { |memo, element| memo + element }
  else
    #result = 1
    #(1..num).each { |n| result *= n }
    #(1..num).inject { |memo, element| memo * element }
    (1..num).inject(:*)
  end
  #result
end

print "Enter an integer: "
top = gets.chomp.to_i
puts
print "Enter 's' to sum or 'p' for product: "
op = gets.chomp.downcase
op == 's' ? op = 'sum' : op = 'product'

puts "The #{op} of the integers, 1 through #{top}, is #{apply_op(top, op)}."