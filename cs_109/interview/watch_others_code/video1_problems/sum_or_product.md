sum_or_product.md
October 28, 2018

Problem:
Wtite a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:
>> Please enter an integer greater than 0:
$ 5
>> Enter 's' to compute the sum, 'p' to compute the product.
$ s
$ The sum of the integers between 1 and 5 is 15.


Breakdown/rules:
Problem type/structure:
A) User input: 1) a number > 0. 2) `s` or `p` to designate sum or product.
B) conditional on s or p determines opration applied to range (1..user_input).
C) Be aware of binary operation! Combine iteration with application of binary operatiion by using `Enumerable#inject`.

- () get user input for top of range.
- () get user input for sum or product
- () iterate through range and apply correct operation based on user input.

input: 1) integer 2) string
output/return: integer
data structures:

algorithm:
1. step 1
2. step 2

tests:
() All tests should evaluate to true.


assessment/sandbox:


Questions/assumptions:
- Need to validate user input?


Reflections:
It would have been helpful to pay greater attention to the given examples as the ui coding would have been a bit quicker. I missed the String#downcase on `op` input. When performing a binary operation, be aware of inject.
Completion time: 26:12
