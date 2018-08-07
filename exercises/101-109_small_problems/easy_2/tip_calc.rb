# Tip calculator

# Creater a simple tip calculator. The program should prompt for a bill amount and
# a tip rate. The program must compute the tip and then display both the tip and
# the total amount of the bill.

# Further exploration:
# Our solution prints the results as $30.0 and $230.0 instead of the more usual
# $30.00 and $230.00. Modify your solution so it always prints the results with
# 2 decimal places.

print "How much is the bill? "
amount = gets.chomp.to_f
print "What percent do you wish to tip? "
tip_percent = gets.chomp.to_f/100
tip_amount = (amount * tip_percent).round(2)
total_bill = amount + tip_amount
puts "The tip is $#{'%.2f' % 
tip_amount}"
puts "The total is $#{'%.2f' % total_bill}"
