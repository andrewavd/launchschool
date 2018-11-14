upcase_words.md
October 30, 2018

Problem:
Write a method that takes a single String argument and returns a new string that contains the original value of the argument, but the first letter of every word is now capitalized.

You may assume that words are any sequence of non-blank charactes, and that only the first character of each word must be considered.


Breakdown/rules:
Problem type/structure: String manipulation.
- () Write a method that takes a single string argument.
- () `words` = ANY series of non-blank characters.
- () ONLY the first character of a word is to be upcased. FIRST CHARACTER, NOT FIRST LETTER.
- () Return the new string.

input: string
output/return: string
data structures:

algorithm:
1. result = ''
2. str_arr = string.split (TEST)
3. arr.each { |word| result << word.capitalize }
4. p result
5. return result

tests:
() All tests should evaluate to true.
word-cap('four score and seven') == 'Four Score And Seven'
word-cap('the javaScript language') == 'The JavaScript Language'
word-cap('this is a "quoted" word') == 'This Is A "quoted" Word'

assessment/sandbox:


Questions/assumptions:
-


Reflections: If manipulating a string, not adding or subtracting anything from it, a result variable shouldn't be necessary. By maniputalting the individual characters of the string, by default you mutate the string object.
Completion time: 20:44
