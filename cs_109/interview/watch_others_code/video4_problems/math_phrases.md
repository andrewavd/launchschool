math_phrases.md
October 31, 2018

Problem:
Part 1:
Write a method that will generate random english math problems. The method should take a length, then return a math phrase with that many operations.

Part 2:
Randomize the number of operators the equation has.

Breakdown/rules:
Problem type/structure:
- ()
- ()
- ()

input:
output/return:
data structures:
NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

algorithm:
1. Could have used multiple options for 'randomization': .sample or .shuffle
2. rand(10) + 1 #rand generates random numbers from 0 to argument -1. 0 operators would be a logic error.

tests:
() All tests should evaluate to true.
p mathphrase(1) #=> "five minus two"
p mathphrase(2) #=> "two plus three times eight"
p mathphrase(3) #=> "one divided by three plus five times zero"

assessment/sandbox:


Questions/assumptions:
- 'divided by' in output, 'divided' in constants. ??? Answer: Output 'divided by'.
- Can operators be used more than once?


Reflections:
Completion time: 10:19
