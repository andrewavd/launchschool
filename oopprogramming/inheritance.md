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

## Super
Ruby provides us with a built-in function called `super` that allows us to call methods up the inheitace herarchy. When you call `super from within a method, it willsearch the inheritance hierarchy for a method by the same name and then invoke it.

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


When called with specific arguments, eg, `super(a, b)`, the specified arguments will be sent up the method lookup chain.
```ruby
class BadDog < Animal
	dev initialize(age, name)
		super(name)
		@age = age
	end
end

BadDog.new(2, "bear")  # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```

This is similar to our previous example, with the difference being that `super` takes an argument, hence the passed in argument is sent to the superclass. Consequently, in this example when a	`BadDog` class is created the passed in `name` argument ("bear") is passed to the superclass and set to the `@name` instance variable.

## Mixing in Modules

Another way to DRY up your code in Ruby is to use *modules*. We've already seen a little bit of how to use modules, but we'll give a few mor examples here.

Extracting common methods to a superclass, like we did in the privious section, is a great way to model concepts that are naturally hierarchiacal. We gave the example of animals. We have a generic superclass called `Animal` tha can keep all basic behavior of all animals. We can then expand on the model a little and have, perhaps, a `Mammal` subclass of `Animal`. We can imagine the entire class hierarchy to look something like the figure below.

![image](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/animal_hierarchy.jpg)

The above diagram shows what pure class baded inheritance looks like. Remember the goal of this is to put the right behavior (i.e., methods) in the right class so we don't need to repeat code in multiple classes. We can imagine that all 1Fish1 objects are related to animals that lilve in the water, so perhaps a 1swim1 method should be in the 1Fish1 class. We can laso imagine that all 1mammal1 objects will have warm blood, so we can create a method caled `qarm_bloded?` in the `Mammal` class and have it return `true`. There fore, the `Cat` and `Dog` objects will have access to the `war_bloded?` method which is automatically inherited from `Mamma` by the `Cat` and `Dog` classes. but they won't have access to the methods in the `Fish` class.

This type of hierarchical modeling works, to some extent, but thre are always exceptions. For example, we put the `swim` method in the `Fish` class, but some mammals can swim as well. We don't want to move the 	swim` method into `Animal` because not all animals swim, and we don't want to create another `swim` method in `Dog` because that violated the DRY principle. For concerns such as these, we'd like to group them into a module and then *mix* in that module to the classes that require those behaviors.

```ruby
module Swimmable
	def swim
		"I'm swimming!"
	end
end

class Animal: end

class Fish < Animal
	include Swimmable     # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
	include Swimmable     # mixing in Swimmable module
end
```

Now `Fish` and `Dog` objects can swim, but objects of other classes won't be able to:

```ruby
sparky = Dog.new
neemo =  Fish.new
paws = Cat.new

sparky.swim   # => I'm swimming!
neemo.swim    # => I'm swimming!
paws.swim     # => NoMethodError: undefined method 'swim' for #<Cat:0x007fc453152308>
```

Using modules to group common behaviors allows us to byuild a mor poweful, flexible and DRY design.

*Note: A common naming convention for Ruby is to use the "able" suffix on whatever ver describes the behavior that the module is modeling. You can see this convetion wit our `Swimmable` module. Likewise, we could name a module that descrebes "walking" a `walkable`. Not all modules are named in this manner, however, it is quite common.*

## Inheritance vs Modules

Now that you know the two primary way that Ruby implements inheritance, class inheritance and mixing in modules, you may wonder when to use one vs the other. Here ate a couple of things to remember when evaluating those two choices.

- You can only subclass from one class, but you can min in as many modules as you'd like.
- if it's an "is-a" relationship, choose class ingeritance. If it's a "has-a" relationship, choose modules. Exammple: a dog "is an" animal; a dog "has an" ability to seim.
- You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.

As you get better at OO design, you'll start to develop a feel for when to use class ingeritance versus mixing in modules.

## Method Lookup Pth

