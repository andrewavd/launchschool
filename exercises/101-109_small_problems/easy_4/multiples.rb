# multiples.rb
# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some number,
# and then computes the sum of those multiples. For instance, if the supplied number is 20,
# the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20)

def multisum(num)
  sum = 0
  (1..num).each do |n|
    if n % 3 == 0 || n % 5 == 0
      sum += n
    end
  end
  sum
end

p multisum(3)    # == 3
p multisum(5)    # == 8
p multisum(10)   # == 33
p multisum(1000) # == 234168