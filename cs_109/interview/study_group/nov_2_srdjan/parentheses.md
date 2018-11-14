parentheses.md
Nomvember 2, 2018

*Problem:*
Write a function called valid_parentheses that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.

# Examples
# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

*Breakdown:*
* Input: [STARTING POINT] 
    - A string made up of left and right parentheses in random order
* Output/Return: [GOAL(s)]
    - boolean true or false
* Data Structures:
    - 

* Rules
- () Valid order of parentheses = both equal numbers of left and right parentheses and also that they all "match".
- 
- 
- 

* Problem type/structure: 

Algorithm(s):
1. check if the number of chars in the sting is odd? return false if it is.
2. convert string to an array.
- initialize valid = true
- intitialize count = 0
- iterate thru arr_str
3. if current element == '(' count += 1 else count -= 1
4. valid = false if count < 0
6. return valid

*Tests:*
() All tests should evaluate to true. *Mark if output will be boolean test results.*
p valid_parentheses( "()" ) == true
p valid_parentheses("(())((()())())") == true
p valid_parentheses("((())))(") == false
p valid_parentheses("((())))(()") == false

*Assessment/sandbox:*


*Questions/assumptions:*
- 
- 

*Reflections:*
*Completion time:*
