require 'date'

def friday_13th(year)
  unlucky = Date.new(year,1,13)
  count = 0
  12.times do
    count +=1 if unlucky.friday?
    unlucky = unlucky.next_month
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1