products.rb
October 27, 2018

Problem:
Write a method that searches the PRODUCTS array. The search method takes a hash as an argument and returns an array containing the search results. The search results contain the product name and prices that meet the search criteria. NOTE: more than one product may meet the criteria.

Breakdown/rules:
Problem type/structure: Search (iterate) through data set array of hashes `PRODUCT`. `Array#select` hashes that match `conditionals` `String#include?()` && price range (price_min..price_max).
- ()Write a method, named `search`.
- ()The search method takes a hash argument:
- ()The hash contains filters for `name` and for a `price range`.

DATA:
  - PRODUCTS : array

method argument : hash
method return : array

algorithm:
1. Find all the products that match the name filter.
  - make name search case insensitive.
2.

assessment/tests/sandbox:

Questions/assumptions:
-

Reflections:
There were two ways to do this. My primary algorithm of checking each hash in `PRODUCTS` for name inclusion and price fitting into a range was critical in both processes. In the end, Array#select is a bit cleaner as it eliminates the step of assignment to a `results` variable.
