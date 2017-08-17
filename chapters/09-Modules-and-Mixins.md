# Chapter Nine

> MODULES AND MIXINS...

As mentioned in an earlier chapter, each Ruby class can only have one immediate ‘parent’, though each parent class may have many ‘children’.

By restricting class hierarchies to single line of descent, Ruby avoids some of the problems that may occur in those programming languages (such as C++) which permit multiple-lines of descent.

When classes have many parents as well as many children and their parents, and children, also have many other parents and children, you risk ending up with an impenetrable network (or ‘knotwork’?) rather than the neat, well- ordered hierarchy which you may have intended.

Nevertheless, there are occasions when it is useful for a class to be able to implement features which it has in common with more than one other pre- existing class.

For example, a Sword might be a type of Weapon but also a type of Treasure; a House might be a type of Building but also a type of Investment and so on.

## A Module Is Like A Class...

Ruby’s solution to this problem is provided by Modules. At first sight, a module looks very similar to a class. Just like a class it can contain constants, methods and classes.

Here’s a simple module:

```ruby
module MyModule
    GOODMOOD = "happy"
    BADMOOD = "grumpy"
    
    def greet
        return "I'm #{GOODMOOD}. How are you?"
    end
end
```

As you can see, this contains a constant, `GOODMOOD` and an ‘instance method’, `greet`. To turn this into a class you would only need to replace the word `module` in its definition with the word `class`.

## Module Methods

In addition to instance methods a module may also have module methods which are preceded by the name of the module:

```ruby
def MyModule.greet
    return "I'm #{BADMOOD}. How are you?"
end
```

In spite of their similarities, there are two major features which classes possess but which modules do not: **instances** and **inheritance**. Classes can have instances (objects), superclasses (parents) and subclasses (children); modules can have none of these.

Which leads us to the next question: if you can’t create an object from a
module, what are modules for?

This is another question that can be answered in two words: **namespaces** and **mixins**. Ruby’s ‘mixins’ provide a way of dealing with the little problem of multiple inheritance which I mentioned earlier. We’ll come to mixins shortly. First though, let’s look at namespaces.

## Modules as Namespaces

You can think of a module as a sort of named ‘wrapper’ around a set of methods, constants and classes. The various bits of code inside the module share the same ‘namespace’ - which means that they are all visible to each other but are not visible to code outside the module.

The Ruby class library defines a number of modules such as Math and Kernel. The Math module contains mathematical methods such as `sqrt` to return a square route and constants such as `PI`. The Kernel module contains many of the methods we’ve been using from the outset such as `print`, `puts` and `gets`.

> ### Constants
> 
> Constants are like variables except their values do not (or should not!) change. In fact, it is (bizarrely!) possible to change the value of a constant in Ruby but this is certainly not encouraged and Ruby will warn you if you do so. Note that constants begin with a capital letter.

**`modules1.rb`**:

Let’s assume we have this module:

```ruby
module MyModule
    GOODMOOD = "happy"
    BADMOOD = "grumpy"

    def greet
        return "I'm #{GOODMOOD}. How are you?"
    end

    def MyModule.greet
        return "I'm #{BADMOOD}. How are you?"
    end
end
```

We can access the constants using `::` like this:

```ruby
puts(MyModule::GOODMOOD)
```

We can similarly access module methods using dot notation – that is, specifying the module name followed by a full stop and the method name. The following would print out ‚I'm grumpy. How are you?‛:

```ruby
puts(MyModule.greet)
```

## Module ‘Instance Methods’

This just leaves us with the problem of how to access the instance method, `greet`. As the module defines a closed namespace, code outside the module won’t be able to ‘see’ the `greet` method so this won’t work:

```ruby
puts(greet)
```

If this were a class rather than a module we would, of course, create objects from the class using the `new` method – and each separate object (each ‘instance’ of the class), would have access to the instance methods. But, as I said earlier, you cannot create instances of modules. So how the heck can we use their instance methods? This is where those mysterious mixins enter the picture…

## Included Modules or ‘Mixins’

**`modules2.rb`**:

An object can access the instance methods of a module just by including that module using the `include` method. If you were to include MyModule into your program, everything inside that module would suddenly pop into existence within the current scope. So the `greet` method of MyModule will now be accessible:

```ruby
include MyModule
puts(greet)
```

The process of including a module in a class is also called ‘mixing in’ the module – which explains why included modules are often called ‘mixins’.

When you include objects into a class definition, any objects created from that class will be able to use the instance methods of the included module just as though they were defined in the class itself.

**`modules3.rb`**:

```ruby
class MyClass
    include MyModule
    
    def sayHi
        puts(greet)
    end
    
    def sayHiAgain
        puts(MyModule.greet)
    end
end
```

Not only can the methods of this class access the `greet` method from MyModule, but so too can any objects created from the class, like this:

```ruby
ob = MyClass.new
ob.sayHi
ob.sayHiAgain
puts(ob.greet)
```

In short, then, modules can be used as a means of grouping together related methods, constants and classes within a named scope. In this respect, modules can be thought of as discreet code units which can simplify the creation of reusable code libraries.

**`modules4.rb`**:

On the other hand, you might be more interested in using modules as an alternative to multiple inheritance. Returning to an example which I mentioned at the start of this chapter, let’s assume that you have a Sword class which is not only a type of Weapon but also of Treasure. Maybe Sword is a descendant of the Weapon class (so inherits methods such as `deadliness` and `power`), but it also needs to have the methods of a Treasure (such as `value` and `insurance_cost`). If you define these methods inside a Treasure `module` rather than a Treasure `class`, the Sword class would be able to include the Treasure module in order to add (‘mix in’) the Treasure methods to the Sword class’s own methods.

**`mod_vars.rb`**:

Note, incidentally, that any variables which are local to a module cannot be accessed from outside the module. This is the case even if a method inside the module tries to access a local variable and that method is invoked by code from outside the module – for example, when the module is mixed in through inclusion. The **`mod_vars.rb`** program illustrates this.

## Including Modules From Files

**`requiremodule.rb`**:

So far, we’ve mixed in modules which have all been defined within a single source file. Often it is more useful to define modules in separate files and include them as needed. The first thing you have to do in order to use code from another file is to load that file using the `require` method, like this:

```ruby
require("testmod.rb")
```

The required file must be in the current directory, on the search path or in a folder listed in the predefined array variable `$:`. You can add a directory to this array variable using the usual array-append method, `<<` in this way:

```ruby
$: << "C:/mydir"
```

The require method returns a `true` value if the specified file is successfully loaded; otherwise it returns `false`. If in doubt, you can simply display the result:

```ruby
puts(require("testmod.rb"))
```

## Pre-Defined Modules

The following modules are built into the Ruby interpreter:

```
Comparable, Enumerable, FileTest, GC, Kernel, Math, ObjectSpace, Precision, Process, Signal
```


The most important of the pre-defined modules is Kernel which, as mentioned earlier, provides many of the ‘standard’ Ruby methods such as `gets`, `puts`, `print` and `require`. In common with much of the Ruby class library, Kernel is written in the C language. While Kernel is, in fact, ‘built into’ the Ruby interpreter, conceptually it can be regarded as a mixed-in module which, just like a normal Ruby mixin, makes its methods directly available to any class that requires it; since it is mixed in to the Object class, from which all other Ruby classes descend, the methods of Kernel are universally accessible.
