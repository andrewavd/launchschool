#Inheritance

**Inheritance** is when a class ##inherits## behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This let's us keep logic in one place.

##Class Inheritance

Here, we're extracting the `speak` method to a superclass `Animal`, and we use inheritance to make that behavior available to `GoodDog` and `Cat` classes.