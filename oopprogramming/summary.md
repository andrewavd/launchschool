# Summary

At this point, you should be familiar with the basics of OOP in Ruby. The major concepts you should understand are:

- relationship between a class and an object
- idea that a class groups behaviors (i.e., methods)

## Object level

- Objects do not share state between other objects, but do share behaviors,
- put another way, the values in the object's instance variables (states) are different, but they can call the same instance methods (behaviors) defined in the class.

## Class level

- Classes also have behaviors not for objects (class methods).

## Inheritance

- **Sub-classing from parent class.** Can only sub-class from 1 parent; used to model hierarchical relationships.
- **Mixing in modules.** Can mix in as many modules as needed: Ruby's way of implementing multiple inheritance.
- Underdtand how sub-classing or mixing in modules affects the method lookup path.

The real magic of OOP is that we can now create custom objects to work with. The Ruby core library in fact works the same way: there are classes, and there are objects instantiated from those classes. When we create our own classes, you can almost think of it as adding additional functionality into the Ruby core libraty (not quite, though).
