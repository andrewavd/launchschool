long_substring.md
November 01, 2018

*Problem:*
Given a string, find the length of the longest substring without repeating characters.


*Breakdown/rules:*
    Problem type/structure: Extraction of subsets throough iteration.

- () generate all substrings of the string.
- () Examine each substring for duplicate characters within the substring.
- () If no duplicate characters, return the length of the longest substring.

    * Input: string
    * Output/Return: integer
    * Data Structures:

Algorithm(s):
1. Nested loop to extract all substrings of a string
2. step 2

*Tests:*
() All tests should evaluate to true. *Mark if output will be boolean test results.*
() Edge cases: *Mark & list if applicable.*
p find_longest("abcabcbb") # "abc" 3
p find_longest("bbbbb") # "b" 1
p find_longest('pwwkew') # "wke" 3



*Assessment/sandbox:*


*Questions/assumptions:*
- 


*Reflections:*
*Completion time:* 49:12
