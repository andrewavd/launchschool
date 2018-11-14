PEDAC.md
Nomvember 1, 2018

*Problem:*
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

*Breakdown:*
* Input: [STARTING POINT] 
    - An array of non-negative integers of undetermined length.
* Output/Return: [GOAL(s)]
    - Integer representing maximum area.
* Data Structures:
    - a nested array that contains all the subsets of "containers".

* Rules
- Create a subset of all the integers in the input array that are greater than 1 in length. Store the elements of the subset in an array. subsets = [[1,3], [1,6]...]
- From that subset, calculate the "capacity" represented by that subset.
- "capacity" = the smallest number at subset[0] || subset[-1] * subset.size
- store the "capacities" in an array as integers.
- Determine the max capacity in the "capacities" array
- return max 

* Problem type/structure: 
This problem is a variant of the create all "subsets" problem.

Algorithm(s):
1. Write a method substrings that calculates all the substrings from the input array greater than 1 in length.
    - create subs = [] to contain elements of substrings
    - create results = [] to contain the substrings
    - Iterate through the input array beginning at element[0], ending at element[-2]. |i|
        - Iterate through the input array from input_arr[i+1]..input_arr[-1]
            - subs = subs << current iteration
            - results << subs
            - return results
2. Write a method that takes results as an argument and calulates capacity.
    - all_capacities = []
    - call create_substrings
    - iterate thru results
        - smallest = lesser of element[0] || element[-1]
        - capacity = smallest * results[current_element.size]
        - all_capacities << capacity
    largest_capacity = all_capacities.max
    return largest_capacity

2. 
3. 

*Tests:*
(x) All tests should evaluate to true. *Mark if output will be boolean test results.*
p calc_capacity([1,8,6,2,5,4,8,3,7]) == 49

*Assessment/sandbox:*


*Questions/assumptions:*
- 
- 

*Reflections:*
*Completion time:*
