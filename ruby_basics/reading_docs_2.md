How would you use String#upcase to create an uppercase version of the string "zyz"?
http://ruby-doc.org/core-2.5.0/String.html#method-i-upcase From documentation: "heLLo".upcase => HELLO

Assume you have this Array:
    a = %w(a b c d e)
How would you use Array#insert to insert the numbers 5, 6, and 7 between the elements with values 'c' and 'd'?
http://ruby-doc.org/core-2.5.0/Array.html#method-i-insert From documentation: a.insert(3, 5, 6, 7)

Assume you have the following code:
    s = 'abc def ghi,jkl mno pqr,stu vwx yz'
    puts s.split.inspect
    puts s.split(',').inspect
    puts s.split(',',2).inspect
What will each of the 3 puts statements print?
http://ruby-doc.org/core-2.5.0/String.html#method-i-split
From the documentation:
puts #1 - ["abc", "def", "ghi,jkl", "mno", "prq,stu", "vwx", "yz"]
puts #2 - ["abc def ghi", "jkl mno pqr", "stu vwx yz"]
puts #3 - ["abc def ghi", "jkl mno pqr", "stu vwx yz"] (I got this wrong)
puts #3 (correct answer) - ["abc def ghi", "jkl mno pqr,stu vwz yz"]

Assume you have the following code:
    require 'date'
    
    puts Date.new
    puts Date.new(2016)
    puts Date.new(2016, 5)
    puts Date.new(2016, 5, 13)

What will each of the 4 puts statements print?
http://ruby-doc.org/stdlib-2.5.0/libdoc/date/rdoc/Date.html#method-c-new
From the documentation:
puts #1 - 2018-05-09 (WRONG - my guess)
puts #1 - -4712-01-01
puts #2 - 2016-01-01
puts #3 - 2016-05-01
puts #4 - 2016-05-13

The Array#bsearch method is used to search ordered Array's more quickly than #find and #select can. Assume you have the following code:
    a = [1, 4, 8, 11, 15, 19]
How would you search this Array to find the first element whose value exceeds 8?
http://ruby-doc.org/core-2.5.0/Array.html#method-i-bsearch
From the docs: a.bsearch{|x| x > 8}

What do each of these puts statements output?
    a = %w(a b c d e)
    puts a.fetch(7)
    puts a.fetch(7, 'beats me')
    puts a.fetch(7) { |index| index**2 }

http://ruby-doc.org/core-2.5.0/Array.html#method-i-fetch
From the docs:
puts #1 - error (the index is too large for the size of the array)
puts #2 - 'beats me' ('beats me' is the default for the issues from #1)
puts #3 - 49 (Again, the index is in error, so the block is executed)

What does this code print?
    5.step(to: 10, by: 3) { |value| puts value }
http://ruby-doc.org/core-2.5.0/Numeric.html output 5 8

s= 'abc'
puts s.public_methods.inspect

You shoudld find that it prints a list of all of the public methods available to the String s; this includes not only those methods defined in the String class, but also methods that are inherited from Object (which inherits other methods from the BasicObject class and the Kernel module). That'a a lot of methods.
How would you modify this code to print just the public methods that are defined or overridden by the String class? That is, the list should exclude all members that are only defined in Objict,  BasicObject, and Kernel.
http://ruby-doc.org/core-2.5.0/Object.html#method-i-public_method
From the docs:
puts s.public_methods(false).inspect
puts s.public_methods(all=false).inspect

a = [5, 9, 3, 11]
puts a.min
Find the documentation for the #min method and change the above code to print the two smallest values in the Array.
(I am running ruby v 2.5.1p57) http://ruby-doc.org/core-2.5.0/Array.html#method-i-min
From the docs: puts a.min(2)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
Find the documentation for YAML::load_file.
ruby-doc.org > Std-lib 2.5.0 > Psych > Methods > load_file (Psych)
