#Chapter Four

>Accesors, attributes and class variables...

Now, getting back to the little adventure game work I was programming
earlier on... I still don’t like the fact that the classes are full of repetitive code due to all those get and set accessors. Let me see what I can do to remedy that.

##Accessor Methods

Instead of accessing the value of the `@description` instance variable with two
different methods, `get_description` and `set_description`, like this...

```ruby
puts( t1.get_description )
t1.set_description( “Some description” )
```

...it would be so much nicer to retrieve and assign values just as you would
retrieve and assign values to and from a simple variable, like this:

```ruby
puts( t1.description )
t1.description = “Some description”
```

In order to be able to do this, I need to modify the Treasure class definition.
One way of doing this would be by rewriting the accessor methods for
`@description` as follows:

```ruby
def description
  return @description
end
```

```ruby
def description=( aDescription )
  @description = aDescription
end
```

**`accessors.rb`**

I have added accessors similar to the above in the `accessors.rb` program. There are two differences from my previous version. First, both of the accessors are called `description` rather than `get_description` and `set_description`; secondly the set accessor appends an equals sign ( **=** ) to the method name. It is now possible to assign a new string like this:

```ruby
t.description = "a bit faded and worn around the edges"
```

And you can retrieve the value like this:

```ruby
puts( t.description )
```

>**Note:** When you write a set accessor in this way, you must append the =
character directly to the method name, not merely place it somewhere
between the method name and the arguments. So this is correct:
```ruby
def name=( aName )
```
But this is an error:
```ruby
def name =( aName )
```

##Attribute Readers and Writers

In fact, there is a simpler and shorter way of achieving the same result. All you have to do is use two special methods, `attr_reader` and `attr_writer`, followed by a symbol like this:

```ruby
attr_reader :description
attr_writer :description
```

You should add this code inside your class definition but outside of any
methods, like this:

```ruby
class Thing
  attr_reader :description
  attr_writer :description
  # some methods here...
end
```

>**Symbols**: In Ruby, a symbol is a name preceded by a colon. `Symbol` is
defined in the Ruby class library to represent names inside the Ruby
interpreter. Symbols have a number of special uses. For example, when
you pass one or more symbols as arguments to `attr_reader` (while it may
not be obvious, `attr_reader` is, in fact, a method of the Module class),
Ruby creates an instance variable and a get accessor method to return the
value of that variable; both the instance variable and the accessor method
will have the same name as the specified symbol.

Calling attr_reader with a symbol has the effect of creating an instance
variable with a name matching the symbol and a get accessor for that variable.

Calling `attr_writer` similarly creates an instance variable with a set accessor.
Here, the variable would be called `@description`. Instance variables are
considered to the "attributes" of an object, which is why the `attr_reader` and
`attr_writer` methods are so named.

**`accessors2.rb`**

The **`accessors2.rb`** program contains some working examples of attribute
readers and writers in action. Notice that Thing class defines a short-form set
accessor (using `attr_writer` plus a symbol) for the `@name` variable:

```ruby
attr_writer :name
```

But it has a long-form get accessor – an entire hand-coded method – for the
same variable:

```ruby
def name
  return @name.capitalize
end
```

The advantage of writing a complete method like this is that it gives you the
opportunity to do some extra processing rather than simply reading and
writing an attribute value. Here the get accessor uses the `String` class’s
`capitalize` method to return the string value of `@name` with its initials letters in uppercase.

The `@description` attribute needs no special processing at all so I have used
both `attr_reader` and `attr_writer` to get and set the value of the
`@description` variable.

>**Attributes or Properties?** Don’t be confused by the terminology. In Ruby,
an "attribute" is the equivalent of what many other programming
languages call a "property".

When you want to read and to write a variable, the `attr_accessor` method
provides a shorter alternative to using both `attr_reader` and `attr_writer`. I
have made use of this to access the `value` attribute in the Treasure class:

```ruby
attr_accessor :value
```

This is equivalent to:

```ruby
attr_reader :value
attr_writer :value
```

##Attributes Create Variables

Earlier I said that calling `attr_reader` with a symbol actually creates a
variable with the same name as the symbol.

The `attr_accessor` method also does this. In the code for the Thing class, this behaviour is not obvious since the class has an `initialize` method which
explicitly creates the variables.

The Treasure class, however, makes no reference to the `@value` variable in its
`initialize` method:

```ruby
class Treasure < Thing
  attr_accessor :value
  def initialize( aName, aDescription )
    super( aName, aDescription )
  end
end
```

The only indication that an `@value` variable exists at all is this accessor
definition which declares a `value` attribute:

```ruby
attr_accessor :value
```

My code down at the bottom of the source file sets the value of each Treasure
object:

```ruby
t1.value = 800
```

Even though it has never been formally declared, the `@value` variable really
does exist, and we are able to retrieve its numerical value using the get
accessor:

```ruby
t1.value
```

To be absolutely certain that the attribute accessor really has created `@value`, you can always look inside the object using the `inspect` method. I have done so in the final two code lines in this program:

```ruby
puts "This is treasure1: #{t1.inspect}"
puts "This is treasure2: #{t2.inspect}"
```

Attribute accessors can initialize more than one attribute at a time if you send them a list of symbols in the form of arguments separated by commas, like this:

```ruby
attr_reader :name, :description
attr_writer(:name, :description)
attr_accessor(:value, :id, :owner)
```

As always, in Ruby, brackets around the arguments are optional.

**`adventure2.rb`**

Now let’s see how to put attribute readers and writers to use in my adventure
game. Load up the **`adventure2.rb`** program. You will see that I have created
two readable attributes in the Thing class: `name` and `description`. I have also made `description` writeable; however, as I don’t plan to change the names of any Thing objects, the `name` attribute is not writeable:

```ruby
attr_reader( :name, :description )
attr_writer( :description )
```

I have created a method called `to_s` which returns a string describing the
Treasure object. Recall that all Ruby classes have a `to_s` method as standard.
The `to_s` method in the Thing class overrides (and so replaces) the default
one. You can override existing methods when you want to implement new
behaviour appropriate to the specific class type.

##Calling Methods of a Superclass

I have decided that my game will have two classes descending from Thing.
The Treasure class adds a `value` attribute which can be both read and written.
Note that its `initialize` method calls its superclass in order to initialize the `name` and `description` attributes before initializing the new `@value` variable:

```ruby
super( aName, aDescription )
@value = aValue
```

Here, if I had omitted the call to the superclass, the `name` and `description`
attributes would never be initialized. This is because `Treasure.initialize`
overrides `Thing.initialize`; so when a Treasure object is created, the code in
`Thing.initialize` will not automatically be executed.

>In some Ruby books, a hash or pound sign may be shown between the
class name and a method name like this: `Treasure#initialize`. This is
purely a convention of documentation (one which I prefer to ignore) and
is not real Ruby syntax. I guess it’s just a case of ‚You say tomayto and I
say tomahto; you say `Treasure#initialize` and I say `Treasure.initialize`.
Heck, let’s not fight about this - it’s only punctuation...!

On the other hand, the Room class, which also descends from Thing, currently
has no `initialize` method; so when a new Room object is created Ruby goes
scrambling back up the class hierarchy in search of one. The first `initialize`
method it finds is in Thing; so a Room object’s `name` and `description`
attributes are initialised there.

##Class Variables

There are a few other interesting things going on in this program. Right at the
top of the Thing class you will see this:

```ruby
@@num_things = 0
```

The two `@` characters at the start of this variable name, `@@num_things`,
define this to be a "class variable". The variables we’ve used inside classes up to now have been instance variables, preceded by a single `@`, like `@name`. Whereas each new object (or ‘instance’) of a class assigns its own values to its own instance variables, all objects derived from a specific class share the same class variables. I have assigned 0 to the `@@num_things` variable to ensure that it has a meaningful value at the outset.

Here, the `@@num_things` class variable is used to keep a running total of the
number of Thing objects in the game. It does this simply by incrementing the
class variable (it uses `+=` to add 1 to it) in the `initialize` method every time a new object is created:

```ruby
@@num_things +=1
```

If you look lower down in my code, you will see that I have created a Map
class to contain an array of rooms. This includes a version of the `to_s` method which prints information on each room in the array. Don’t worry about the implementation of the Map class; we’ll be looking at arrays and their methods shortly.

###Insert image

This diagram shows a Thing class (the rectangle) which contains a
class variable, `@@num_things` and an instance variable, `@name`.
The three oval shapes represent "Thing objects" – that is, ‘instances’
of the Thing class. When one of these objects assigns a value to its
instance variable, `@name`, that value only affects the `@name`
variable in the object itself – so here, each object has a different
value for `@name`. But when an object assigns a value to the class
variable, `@@num_things`, that value "lives inside" the Thing class
and is ‘shared’ by all instances of that class. Here `@@num_things`
equals 3 and that is true for all the Thing objects.

Find the code down at the bottom of the file and run the program in order to
see how we have created and initialised all the objects and used the class
variable, `@@num_things`, to keep a tally of all the Thing objects that have
been created.
