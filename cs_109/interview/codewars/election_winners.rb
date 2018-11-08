# election_winners.rb
# November 8, 2018
# 7kyu
# Completion time: 34:13

# Problem:
# Given an array of the numbers of votes given to each of the candidates so far, and an integer k equal
# to the number of voters who haven't cast their vote yet, find the number of candidates who still have
# a chance to win the election.
# The winner of the election must secure strictly more votes than any other candidate. If two or more
# candidates receive the same(maximum) number of votes, assume there is no winner at all.

def elections_winners(votes, k)
  return 1 if k == 0 && votes.count(votes.max) == 1
  result = 0
  votes.each { |n| result += 1 if n + k > votes.max }
  result
end

p elections_winners([2, 3, 5, 7], 3) == 2
p elections_winners([1, 3, 3, 1, 1],0) == 0
p elections_winners([5, 1, 3, 4, 1],0) == 1
p elections_winners([1, 1, 1, 1],1) == 4
p elections_winners([1, 1, 1, 1],0) == 0
p elections_winners([3, 1, 1, 3, 1],2) == 2