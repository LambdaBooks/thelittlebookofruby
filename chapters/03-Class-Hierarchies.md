# Chapter Three

> CLASS HIERARCHIES…

We ended the last lesson by creating two new classes: a Thing and a Treasure. In spite of the fact that these two classes shared some features (notably both had a ‘name’), there was no connection between them. Now, these two classes are so trivial that this tiny bit of repetition doesn’t really matter much. However, when you start writing real programs of some complexity, your classes will frequently contain numerous variables and methods; and you really don’t want to keep recoding the same old stuff over and over again.

It makes sense to create a class hierarchy in which a class which is a ‘special type’ of some other class simply ‘inherits’ the features of that other class. In our simple adventure game, for instance, a Treasure is a special type of Thing so the Treasure class should inherit the features of the Thing class.

> **Class Hierarchies – Ancestors and Descendants:** In this book, I often talk about ‘descendant’ classes ‘inheriting’ features from their ‘ancestor’ classes. These terms deliberately suggest a kind a family relationship between ‘related’ classes. In Ruby, each class only has one parent. A class may, however, descend from a long and distinguished family tree with
many generations of grandparents, great-grandparents and so on...

The behaviour of Things in general will be coded in the Thing class itself. The Treasure class will automatically ‘inherit’ all the features of the Thing class, so we won’t need to code them all over again. It will then add some additional features, specific to Treasures.

As a general rule, when creating a class hierarchy, the classes with the most generalised behaviour are higher up the hierarchy than classes with more specialist behaviour. So a Thing class with just a name and a description, would be the ancestor of a Treasure class which has a name, a description and, additionally, a value; the Thing class might also be the ancestor of some other specialist class such as a Room which has a name, a description and also exits — and so on...

### **INSERT IMAGE**

**One Parent, Many Children...**

The diagram above shows a Thing class which has a *name* and a *description* (in a Ruby program, these might be internal variables
such as `@name` and `@description` plus some methods to access
them). The Treasure and Room classes both descend from the Thing class so they automatically ‘inherit’ a *name* and a *description*. The Treasure class adds one new item: *value* – so it now has *name*, *description* and *value*; The Room class adds exits – so it has *name*, *description* and *exits*.

**`adventure1.rb`**

Let’s see how to create a descendant class in Ruby. Load up the **`adventure1.rb`** program. This starts simply enough with the definition of a Thing class which has two instance variables, `@name` and `@description`. These variables are assigned values in the initialize method when a new Thing object is created. Instance variables generally cannot (and should not) be directly accessed from the world outside the class itself due the principle of encapsulation.

> **«Encapsulation»** is a term that refers to the ‘modularity’ of an object. Put simply, it means that only the object itself can mess around with its own internal state. The outside world cannot. The benefit of this is that the programmer is able to change the implementation of methods without having to worry that some external code elsewhere in the program relies upon some specific detail of the previous implementation.

In order to obtain the value of each variable in a Thing object we need a *get* accessor method such as `get_name`; in order to assign a new value we need a *set* accessor method such as `set_name`:

```ruby
def get_name
  return @name
end

def set_name(aName)
  @name = aName
end
```

## Superclasses and Subclasses

Now look at the Treasure class. Notice how this is declared:

```ruby
class Treasure < Thing
```

The angle bracket, `<`, indicates that Treasure is a ‘subclass’, or descendant, of Thing and therefore it inherits the data (variables) and behaviour (methods) from the Thing class. Since the `get_name`, `set_name`, `get_description` and `set_description` methods already exist in the ancestor class (Thing) these don’t need to be re-coded in the descendant class (Treasure).

The Treasure class has one additional piece of data, its value (`@value`) and I have written `get` and `set` accessors for this. When a new Treasure object is created, its `initialize` method is automatically called. A Treasure object has three variables to initialize (`@name`, `@description` and `@value`), so its initialize method takes three arguments:

```ruby
def initialize(aName, aDescription, aValue)
```

The first two arguments are passed, using the `super` keyword, to the `initialize`method of the superclass (Thing) so that the Thing class’s `initialize` method can deal with them:

```ruby
super(aName, aDescription)
```

When used inside a method, the `super` keyword calls a method with the same name in the ancestor or ‘super’ class.

The current method in the Treasure class is called `initialize` so when code inside this method passes the two arguments (`aName`, `aDescription`) to `super` it is actually passing them to the `initialize` method of its superclass, Thing.

If the `super` keyword is used on its own, without any arguments being
specified, all the arguments sent to the current method are passed to the ancestor method.
