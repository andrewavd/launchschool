calc_primes.md
October 28, 2018

Problem:
Write a method that will deermine whether an interger is a prime. Don't use the ruby Prime class.


Breakdown/rules:
Problem type/structure: Test a single input for a condition.
- (x) Write a method. `is_prime?(n)`
- (x) `is_prime?` takes and integer greater than 1.
- (x) Calculate if n is a prime number.
- (x) `is_prime?` returns a boolean.

input:
output/return:
data structures:

algorithm: (Check if n is prime)
1. if n < 2 || n == 2 || n == 3, return false.
2. if n % 2 == 0 || n % 3 == 0, return false.
3. else return true.

tests:
(x) All tests should evaluate to true.
is_prime?(3) == true
is_prime?(4) == false

assessment/sandbox:


Questions/assumptions:
- `n` is an integer greater than 1?


Reflections:
Completion time: 8:46
