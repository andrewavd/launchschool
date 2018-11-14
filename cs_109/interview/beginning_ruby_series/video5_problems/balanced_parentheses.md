balanced_parentheses.rb
October 27, 2018

Problem:
Write a method that takes a string, and returns a boolean indicating whether this string has a balanced set of parentheses.


Breakdown/rules:
- (x)Write a method named balanced?(str).
- ()Determine the number and order of the parentheses in the string argument.
- ()Determine if parentheses are balanced? What is balanced?

input: string
output/return: boolean
data structures:

algorithm:
1. balanced parentheses = ?
  - odd number of parentheses in set = false.
2. step 2

assessment/tests/sandbox:
balancer?("hi") == true # I believe this should be false.
balancer?("(hi") == false
balancer?("(hi)") == true

Bonus:
balancer?(")hi(") == false

Questiions/assumptions:
- What is the definition of balanced? Equal number of opposing parentheses or an equal number of matching parentheses in the correct "order"?
- How can a string with no parentheses be a balanced set?

Reflections:
Completion time: 44:14
This was a somewhat difficult exercise because of the ambiguity in the definition of what a balanced set of parentheses is. As I questioned above, how can a string with no parentheses be balanced???

I have written the code to pass the tests but I believe that the code should actually be implemented with ln 13 uncommented and ln 14 commented out. This change would fail the first test as I believe it should fail. (It has no parentheses, it can't be balanced!)
