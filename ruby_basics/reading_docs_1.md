Where can you find the most complete Ruby documentation?
http://ruby-doc.org

Locate the description of the while loop in the ruby documentation.
http://ruby-doc.org/core-2.5.0/doc/syntax/control_expressions_rdoc.html
Scroll down to "while Loop" reference.

Using the ruby documentation, determine what value a while loop returns.
From the documentation, "The result of a while loop is nil unless break is used to supply a value."

In the previous exercise you learned that the while loop returns nil unless break is used. Locate the documentation for break, and determine what value break sets the return value to for the while loop.
http://ruby-doc.org/core-2.5.0/doc/syntax/control_expressions_rdoc.html Scroll down past the while loop documentation until you reach the break documentation. From the documentation, "break accepts a value that supplies the result of the expression it is 'breaking' out of".

Using the ruby documentation, determine how you can write large numbers in a way that makes them easier to read.
http://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html (Admittedly I cheated on this one. I would not have found this without some help!)

Using the ruby documentation, determine how you would write a symbol that represents your name. We aren't looking for a string; we want a symbol, which is one of ruby's datatypes.
http://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html Scroll down to the documentation for symbols. :name

Consider the following method and a call to that  method:

def my_method(a, b = 2, c = 3, d)
    p [a, b, c, d]
end

my_method(4, 5, 6)

Use the ruby documentation to determine what this code will print.
Output is: [4, 5, 3, 6] I got this wrong believing the output would be: [4, 5, 6, nil]. Documentation can be found at: http://ruby-doc.org/core-2.5.0/doc/syntax/calling_methods_rdoc.html Scroll down to "Default Positional Arguments". From the documentation: "First 1 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3."

Lets move on now to the documentation you will use most often; the core API section on Classes and Modules. All of these are listed under Classes on the Core APE page. Locate and open the class documentation for the String class.
http://ruby-doc.org/core-2.5.0/String.html

Use the ruby documentation for the String class to determine which method can be used to right justify a String object.
rjust(integer,padstr='') http://ruby-doc.org/core-2.5.0/String.html#method-i-rjust

Locate the ruby documentation for methods File::path and File#path. How are they different?
http://ruby-doc.org/core-2.5.0/File.html#method-c-path Use index of Methods on left side of page. File::path - Returns the string representation of the path
File#path - Returns the pathname used to create file as a string. Does not normalize the name.

The pathname may not point to the file corresponding to file. For instance, the pathname becomes void when the file has been moved or deleted.

This method raises IOError for a file created using File::Constants::TMPFILE because they don't have a pathname.

