interleave.md
October 29, 2018

Problem:
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternatiion.

You mas assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


Breakdown/rules:
Problem type/structure: `loop` to array.size. Create new array comprised of elements from provided arrays.

- () Write a method. def interleave(arr1, arr2)
- () loop until (array.size - 1)
- () push each element of the two provided arrays onto the new array.
        - alternate pushing arr1 then arr2.
- () return the new array.

input: 2 arrays
output/return: array
data structures:

algorithm:
1. step 1
2. step 2

tests:
(x) All tests should evaluate to true.
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

assessment/sandbox:


Questions/assumptions:
-


Reflections:
Completion time:
