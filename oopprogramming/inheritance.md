# Inheritance

**Inheritance** is when a class **inherits** behavior from another class. The class that is inheriting behavior is called the subclass and the class it inherits from is called the superclass.

We use inheritance as a way to extract common behaviors from classes that share that behavior, and move it to a superclass. This let's us keep logic in one place.

### Class Inheritance
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

puts sparky.speak  # => Sparky says arf!
puts paws.speak     # => Hell0!
```

In the `GoodDog` class, we're **overriding** the `speak` method in the `Animal` class because Ruby checks the object's class first for the method before it looks in the superclass. So, that means when we wrote the code `sparky.speak`, it first looked at `sparky`'s class, which is `GoodDeg`. It found the `speak` method there and used it. When we wrote the code `paws.speak`, Ruby first looked at `paws`'s class, which is `Cat`. It did not find a `speak` method there , so it continued to look in `Cat`'s superclass, `Animal`. It found a `speak` method in `Animal`, and used it We'll talk about the *method lookup* path more in depth in a bit.

Inheritance is a great way to remove duplication in our code.

### Super
Ruby provides us with a built-in function called `super` that allows us to call methods up the inheritance herarchy. When you call `super` from within a method, it will search the inheritance hierarchy for a method by the same name and then invoke it.

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

Another more common way of using `super` is with `initialize`.
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

### Mixing in Modules
Another way to DRY up your code in Ruby is to use *modules*. We've already seen a little bit of how to use modules, but we'll give a few more examples here.

Extracting common methods to a superclass, like we did in the previous section, is a great way to model concepts that are naturally hierarchiacal. We gave the example of animals. We have a generic superclass called `Animal` that can keep all basic behavior of all animals. We can then expand on the model a little and have, perhaps, a `Mammal` subclass of `Animal`. We can imagine the entire class hierarchy to look something like the figure below.

![image](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/animal_hierarchy.jpg)

The above diagram shows what pure class based inheritance looks like. Remember the goal of this is to put the right behavior (i.e., methods) in the right class so we don't need to repeat code in multiple classes. We can imagine that all `Fish` objects are related to animals that live in the water, so perhaps a `swim` method should be in the `Fish` class. We can also imagine that all `mammal` objects will have warm blood, so we can create a method caled `warm_blooded?` in the `Mammal` class and have it return `true`. Therefore, the `Cat` and `Dog` objects will have access to the `warm_blooded?` method which is automatically inherited from `Mammal` by the `Cat` and `Dog` classes. but they won't have access to the methods in the `Fish` class.

This type of hierarchical modeling works, to some extent, but there are always exceptions. For example, we put the `swim` method in the `Fish` class, but some mammals can swim as well. We don't want to move the `swim` method into `Animal` because not all animals swim, and we don't want to create another `swim` method in `Dog` because that violated the DRY principle. For concerns such as these, we'd like to group them into a module and then *mix* in that module to the classes that require those behaviors.

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

Using modules to group common behaviors allows us to build a more poweful, flexible and DRY design.

*Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convetion with our `Swimmable` module. Likewise, we could name a module that descrebes "walking" a `walkable`. Not all modules are named in this manner, however, it is quite common.*

### Inheritance vs Modules
Now that you know the two primary ways that Ruby implements inheritance, class inheritance and mixing in modules, you may wonder when to use one vs the other. Here are a couple of things to remember when evaluating those two choices.

- You can only subclass from one class, but you can mix in as many modules as you'd like.
- if it's an "is-a" relationship, choose class inheritance. If it's a "has-a" relationship, choose modules. Example: a dog "is an" animal; a dog "has an" ability to seim.
- You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.

As you get better at OO design, you'll start to develop a feel for when to use class ingeritance versus mixing in modules.

### Method Lookup Path
Now that you have a grasp on both inheritance and mixins. Let's put them both together to see how that affects the *method lookup path*. Recall the method lookup path is the order in which classes are inspected when you call a method.

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```

We have three modules and one class. We've mixed in one module into the `Animal` class. The method lookup path is  the path Ruby takes to look for a method. We can see this path with the `ancestors` class method.

```ruby
puts "---Animal method lookup---"
puts Animal.ancestors
```

The output looks like this:

```
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
```

This means that when we call a method of any `Animal` object, first Ruby looks in the `Animal` class, then the `Walkable` module, then the `Object` class, then the `Kernel` module, and finally the `BasicObject` class.

```ruby
fido = Animal.new
fido.speak    # => I'm an animal, and I speak!
```

Ruby found the `speak` method in the `Animal` class and looked no further.

```
fido.walk  # => I'm walking.
```

Ruby first looked for the `walk` instance method in `Animal`, and not finding it there, kept looking in the next place according to our llist, which is the `Walkable` module. It saw a `walk` method there, executed it , and stropped looking furthe.

```
fido.swim
# => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>
```

Ruby traversed all the classes and modules in the list, and didn't find a `swim` method, so it threw an error.

Let's add another class to the code above. This class will inherit from the `Animal` class and mix in the `Swimmable` and `Climbable` modules.

```ruby
class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors
```

and this is the output we get:

```
---GoodDog mehtod lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasecObject
```

There are several interesting things about the above output. First, this tells us that the order in which we include modules is important. Ruby actually looks at the last module we included *first*. This means that in the rare occurrence that the modules we mix in contain a method with the same name, the last module included will be consulted first. the second interesting thing is that the module included in the superclass made it on to the the method lookup path. Tha means that all `GoodDeg` objects will have access to not only `Animal` methods, but also methods defined in the `Walkable` module, as well as all other modules mixed in to any of its superclasses.

Sometimes when you're working on a large project, it can be confusing where all these methods are coming from. By underatandeng the method lookup path, we can have a better idea of where and how all available methods are organized.

### More Modules
We've already seen how modules can be used to mix-in common behavior into classes. Now we'll see two mor uses for modules.

The first use case we'll discuss is using modules for **namespacing**. In this context, namespacing means organizing similar classes under a module. In other words, we'll use modules to group related classes. There in lies the first advantage of using modules for namespacing. It becomes easy for us to recognize related classes in our code. The second advantage is it reduces the likelihood of our classes colliding with other similarly named classes in our codebase. Here's how it works:

```ruby
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```

We call classes in a module by appending the class name to the module name with two colons(::)

```ruby
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speal('Ar!')       # => "Arf!"
kitty.say_name('kitty')  # => "kitty"
```

The second use case for modules we'll look at is using modules as a **container** for methods, called module methods. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code. Let's use uor `Mammal` module to demonstrate:

```ruby
Module Mammal
  ...

  def self.some_out_of_place_method(num)
    num ** 2
  end
end
```

Defining methods this way within a module means we can call them directly from the module:

```ruby
value = Mammal.some_out_of_place_method(4)
```

We can also call such methods by doing:

```ruby
value = Mammal::some_out_of_place_method(4)
```

although the former is the preferred way.

### Private, Protected and Public
The last thing we want to cover is something that's actually quite simple, but necessary. Until now, all the mehods in our `GoodDog` class are public methods. A **public method** is a method that is available to anyone who knows either the class name or the object's name. These mehods are readily available for the rest of the program to use and comprise the class's *interface* (that's how other classes and objects will interact with this class and its objects).

Sometimes you'll have methods that are doing work in the class but don't need to be available to the rest of the program. These methods can be defined as **private**. How do we define private mehoods? We use the reserved word `private` in our program and anytrhing below it is private (unless another reserved word is placed after it to negate it).

In our `GoodDog` class we have one operation that takes place that we could move into a private metod. When we initialize an object, we calculate the dog's age in Dog years. Let's refactor this logic into a method and make it private so nothing outside of the class can use it.

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
```

We get the error message:

```ruby
NoMethodError: private method `human_years' called for #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>
```

We have made the `human_years` method private by placing it under the `private` reserved word. So what is it good for if we can't call it? `private` methods are only accessible from other methods in the class. For example, given the above code, the following would be allowed:

```ruby
# assume the method definition below is above the "private" keyword

def public_disclosure
  "#{self.name} in human years is #{human_years}"
end
```

Note that in this case, we can *not* use `self.human_years`, because the `human_years` method is private. Remember that `self.human_years` is equivalent to `sparky.human_years`, which is not allowed for private methods. Therefore, we have to just use `human_years`. In summary, private methods are not accessible outside of the class definition at all, and are only accessible from inside the class when called without `self`.

Public and private methods are most common, but in some less common situations, we'll want an in-between approach. We can use the `protected` keyword to  create **protected** methods. The easiest way to understand protected methods is to follow these two rules:

- from outside the class, `protected` methods act just like `private` methods.
- from inside the class, `protected` methods are accessible just like `public` methods.

Let's take a look at some examples:

```ruby
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end
```

Study the above code, as it's a little complicated.We'll create an `Animal` object and test it out.

```ruby
fido = Animal.new
fido.a_public_method  # => Will this work? Yes, I'm protected!
```

The above line of code shows us that we can call a `protected` method from within the class, even with `self` prepended. What about outside of the class?

```ruby
fido.a_protected_method
  # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>
```

This demonstrates the second rule, that we can't call protected methods from outside of the class. The two rules for `protected` methods apply within the context of inheritance as well.

There are some exceptions to this rule, but we won't worry about that yet. If you remember those two rules about protected mehtods, that should be good enough for the time being.

### Accidental Method Overriding
It is important to remember that every class you create inherently subclasses from **class Object**. The `Object` class is built into Ruby and comes with many critical methods.

```ruby
class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass  # => Object
```

This means that methods defined in the `Object` class are available in *all classes*.

Further, recall that through the magic of inheritance, a subclass can override a supeclass's method.

```ruby
class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi   # => "Hi from Child."
```

This means that, if you accidentally override a method that was originally defined in the `Object` class, it can have far-reaching effects on your code. For example, `send` is an instance method that all classes inherit from `Object`. If you define a new `send` instance method in your class, all objects of you class will call your custom `send` method, instead of the one in class `Object`, which is probably the one they mean to call. Object `send` serves as a way to call a method by passing it a symbol or a string which represents the method you want to call. The next couple of arguments will represent the method's arguments, if any. Let's see how `send` normally works by making use of our  `Child` class:

```ruby
son.Child.new
son.send :say_hi   # => "Hi from Child."
```

Let's see what happens when we define a `send` method in our `Child` class ans then try ti invole `Object`'s `send` method:

```ruby
class Child
  def say_hi
    p "Hi from Child/"
  end

  def send
    p "send from Child..."
  end
end

lad = Child.new
lad.send :say_hi
```

Normally we would expect the output of this call to be `"Hi from Child." but upon running the code we get a completely different result:

```ruby
ArgumentError: worn number of arguments (1 for 0)
from (pry:12:in 'send'
```

In our example , we're passing `send` one argument even though our overridden `send` method does not take any arguments. Let's take a look at another example by exploring Object's `instance_of?` method. What this handy method does is to return `true` if an object is an instance of a given class and `false` otherwise. Let's see it in action:

```ruby
c = Child.new
c.instance_of? Child  # => true
c.instance_of> Parent # => false
```

Now let's override `instance_of?` within `Child`:

```ruby
class Child
  # other methods omitted

  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child
```

Again, we'll see something completely different though or intention was to use Object's `instance_of?` method:

```ruby
ArgumentError: wrong number of arguments (1 for 0)
from (pry):22:in 'instance_of?'
```

That said, one `Object` instance method that's easily overridden without any major side-effect is `to_s` method. You'll normally want to do this when you want a different string representation of an object. Overall, it's imprtant to familiarize yourself with some of the common `Object` methods and make sure to not accidentally override them as this can have devastating consequences for your appllication.
