# Inheritance

**Inheritance** is when a class **inherits** behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This let's us keep logic in one place.

## Class Inheritance

Here, we're extracting the `speak` method to a superclass `Animal`, and we use inheritance to make that behavior available to `GoodDog` and `Cat` classes.

```ruby
# good_dog_class.rb

class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak
puts paws.speak
```

We use the `<` symbol to signify that the `GoodDog` class is inheriting from the `Animal` class. This means that all of the methods in the `Animal` class are available to the `GoodDog` class for use. We also created a new class called `Cat` that inherits from `Animal` as well. We've eliminated the `speak` method form the `GoodDog` class in order to use the `speak` method from `Animal`. Both classes are now using the superclass `Animal`'s  `speak` method.

What if we want to use the original `speak` method form the `GoodDog` class only. Let's add it back and see what happens.
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} say arf!"
  end
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sprarky.speak  # => Sparky says arf!
puts paws.speak     # => Hell0!
```

In  the `GoodDog` class, we're **overriging** the `speak` method in the `Animal` class because Ruby checks the objiect's class first for the method before it looks in the superclass. So, that means when we wrote the code `sparky.speak`, it firs looked at `sparky`1's class, which is `GoodDeg`. It found th `speak` method there and used it. When were wrote the code `paws.speak`, Ruby first looked at `pawa`'s xlass, which is `Cat`. It did not fined a `spesl` methos there , so it continued to look in `Xat`'s superclass, `Animal`. It found a `speak` mehtod in `Animal`, and used it Wi'll talk about the *methos lookup* path mor in depth in a bit.


