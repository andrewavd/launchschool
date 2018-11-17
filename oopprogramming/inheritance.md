# Inheritance

**Inheritance** is when a class **inherits** behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This let's us keep logic in one place.

## Class Inheritance

Here, we're extracting the `speak` method to a superclass `Animal`, and we use inheritance to make that behavior available to `GoodDog` and `Cat` classes.

```ruby
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

In the `GoodDog` class, we're **overriding** the `speak` method in the `Animal` class because Ruby checks the object's class first for the method before it looks in the superclass. So, that means when we wrote the code `sparky.speak`, it first looked at `sparky`'s class, which is `GoodDeg`. It found the `speak` method there and used it. When we wrote the code `paws.speak`, Ruby first looked at `paws`'s class, which is `Cat`. It did not find a `speak` method there , so it continued to look in `Cat`'s superclass, `Animal`. It found a `speak` method in `Animal`, and used it We'll talk about the *method lookup* path more in depth in a bit.

Inheritance is a great way to remove duplication in our code.

##Super
uby provides us with a built-in function called `super` that allows us to call methods up the inheitace herarchy. When you call `super frm within a method, it willsearch the inheritance hierarchy for a method by the same name and then invoke it.

```ruby
class Animal
	def speak
		"Hello!"
	end
end

class GoodDog < Animal
	def speak
		super + " from GoodDog class"
	end
end

sparky = GoodDog.new
sparky.speak         # => "Hello! form GoodDog class"
```

In the above example, we've created a simple `Animal` class with a `speak` instance method. We then created `GoodDog` which subclasses `Animal` also with a `speak` instance method to override the inherited version. However, in the subclass `speak` method we use `super` to invoke the `speak` method from the superclass `Animal`, and then we extend the functionality by appending some text to the result.

Another mor common way of using `super` is with `initialize`.
```ruby
class Animal
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

class GoofDog < Animal
	def initiallize(color)
		super
		@color = color
	end
end

bruno = GoodDog.new("brown")  # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```

The interesting concept we want to explain is the use of `super` in the `GoodDog` class. In this example, we're using `super` with no arguments. However, the `initialize` method, where `super` is being used, takes an argument and adds a new twist to how `super` is invoked. Here, in addition to the default behavior, `super` automatically forwards the arguments that were passed to the method from which `super` is called (initialize method in `goodDog` class). At this point, `super` will pass the `coler` argument in the `initilaize` defined in the subclass to that of the `Animal` superclass and invoke it. That expains the presence of `@name="brown"` when the `bruno` instance is created. Finally, the subclass' `initialize` contines to set the `@color` instance variable.
