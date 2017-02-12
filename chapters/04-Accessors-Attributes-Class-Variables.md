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

