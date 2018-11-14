# cinema_breakeven.rb
# November 8, 2018
# 7kyu
# Completion time: 0:00

# Problem:
# My friend John likes to go to the cinema. He can choose between system A and system B.

# System A : buy a ticket (15 dollars) every time
# System B : buy a card (500 dollars) and every time buy a ticket the price of which is 0.90 times
# the price he paid for the previous one.

#Example: If John goes to the cinema 3 times:
# System A : 15 * 3 = 45
# System B : 500 + 15 * 0.90 + (15 * 0.90) * 0.90 + (15 * 0.90 * 0.90) * 0.90 ( = 536.5849999999999,
# no rounding for each ticket)

# John wants to know how many times he must go to the cinema so that the final result of System B, when
# rounded up to the next dollar, will be cheaper than System A.

# The function movie has 3 parameters: card (price of the card), ticket (normal price of a ticket),
# perc (fraction of what he paid for the previous ticket) and returns the first n such that

# ceil(price of System B) < price of System A.

# More Examples:
# movie(500, 15, 0.9) should return 43 
#    (with card the total price is 634, with tickets 645)
# movie(100, 10, 0.95) should return 24 
#    (with card the total price is 235, with tickets 240)

def movie(card, ticket, perc)
  visits = 1
  total = 0
  3.times do
    p visits
    p cost_sys_a = visits * ticket
    1.upto(visits) do
      p total += ticket * perc
      ticket = total
    end
    p cost_sys_b = card + total
    break if cost_sys_b.round < cost_sys_b.round
    visits += 1
  end
  visits
end

p movie(500, 15, 0.9) == 43
#p movie(100, 10, 0.95) == 24
