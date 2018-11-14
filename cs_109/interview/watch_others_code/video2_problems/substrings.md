substrings.md
October 29, 2018

Problem:
Write a method that will return a substring based on specifiied indices.


Breakdown/rules:
Problem type/structure: Identify a range within a string and assign a variable to that range (substring) and return it.
- () Write a method that takes upto 3 arguments.
    1. string
    2. integer - index of first character in substring
    3. integer - index of last character in substring
- () Need a default value for 3rd argument.
- ()

input:
output/return: string, integer, integer
data structures:

algorithm:
1. sub = string[idx1..idx2]
2. step 2

tests:
(x) All tests should evaluate to true.
substring("honey", 0, 2) == "hon"
substring("honey", 1, 2) == "on"
substring("honey", 3, 9) == "ey"
substring("honey", 2) == "n"

assessment/sandbox:


Questions/assumptions:
- 3rd value needs a default argument, do any other arguments need defaults?


Reflections:
Completion time: 12:22
