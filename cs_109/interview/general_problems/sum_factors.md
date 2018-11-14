sum_factors.md
Nomvember 1, 2018

*Problem:*
Suppose you have an arbitrary natural number (the target) and a set of one or more additional natural numbers (the factors). Write a program that computes the sum of all numbers from 1 up to the target number that are also multiples of one of the factors.

For instance, if the target is 20, and the factors are 3 and 5, that givs us the list of multiples 3, 5, 6, 9, 10, 12, 15, 18. The sum of these multiples is 78.

If no factors are given, use 3 and 5 as the default factors.


*Breakdown/rules:*
* Input: [STARTING POINT] 
    - An integer that is greater than 0 called the "target".
    - A possible set of natural numbers called the "factors". The defalult factors are 3 and 5 if NO factors are given.
    - See questions below.
* Output/Return: [GOAL(s)]
    - An array of multiples of the provided factors.
    - An integer representing the sum of all the "multiples" of the factors upto, but NOT including the target.
* Data Structures:
    - array for initial factors.
    - a single array for the multiples of each factor.

- From a set of provided factors and a provided target value determine the initial values of the factors and target.
    - if 2 or more factors are provided, factors are set. If no factors are provided, set factors to default values of 3 & 5. If one factor is provided, second factor value is UNKNOWN.
- Derive all the multiples of the provided factors (or their defaults) up to, but not including, the        provided target number and capture them to be summed.
- Do not duplicate multiples already created from other factors.
- Sum all the derived multiples.
- Return the value of the summed multiples.

Problem type/structure: 

Algorithm(s):
1. if array of factors.empty? populate factors array with defaults.
2. if array of factors contains only 1 element, OUTCOME UNKOWN.
3. Define method, passing in factors and target, to determine multiples of factors up to but not including the target.
    - initialize an array that will contain the derived multiples of the factors.
    - iterate through the array containing the factors.
    - iterate through the range of the current factor, to the target, stepping by the factor.
        - push current element of iteration to the multiples array if the array does not already contain that value.
    - return the multiples array
4. Define a method, passing in target and the factors array, that will sum the multiples of the factors, up to but not including the target.
    - call the method that will derive the multiples.
    - sum the values of the returned multiples array
    - return the calulated sum
5. Output the returned calculated sum.

*Tests:*
() All tests should evaluate to true. *Mark if output will be boolean test results.*

p sum_multiples(20, [3, 5])
p sum_multiples(20, [])
p sum_multiples(20, [3])
p sum_multiples(20, [5])
p sum_multiples(5, [1, 2])
p sum_multiples(1, [2])



*Assessment/sandbox:*


*Questions/assumptions:*
- Can there be more than two factors?
- What if there is only one factor provided, is the default 3 or 5 for the second factor? Answer: Defaults only take affect if there are NO factors are provided. If one factor is provided, use that one factor only.
- Can we assume the target will ALWAYS be provided and is greater than the provided factor(s)? Answer: yes.
- 


*Reflections:*
*Completion time:*
