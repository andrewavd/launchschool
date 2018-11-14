prob2_practice.md
October 31, 2018

Problem:
Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, or false if you do not. We only care about substrings that are longer than one letter long.


Breakdown/rules:
Problem type/structure: 1) String manipulation: extract sets of characters. 2) Build array(s) from string extractions. 3) Array comparison.

- () build a set of substrings greater than 1 character from the given strings. Each string will have its' own set of substrings.
- () Iterate through the smaller set of substrings and check if any of it's elements are included in the larger subset.
- () Return true or false depending on step 2.

input: 2 strings
output/return: boolean
data structures (needed): arrays

algorithm:
1. step 1
2. step 2

tests:
() All tests should evaluate to true.
p some_method(str) == "Andy"

assessment/sandbox:


Questions/assumptions:
-


Reflections:
Completion time:
