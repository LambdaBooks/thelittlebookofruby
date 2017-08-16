# Chapter Six

> HASHES...

While arrays provide a good way of indexing a collection of items by number, there may be times when it would be more convenient to index them in some other way. If, for example, you were creating a collection of recipes, it would be more meaningful to have each recipe indexed by name such as ‚Rich Chocolate Cake‛ and ‚Coq au Vin‛ rather than by numbers: 23, 87 and so on.

Ruby has a class that lets you do just that. It’s called a Hash. This is the equivalent of what some other languages call a ‘Dictionary’. Just like a real dictionary, the entries are indexed by some unique key (in a dictionary, this would be a word) and a value (in a dictionary, this would be the definition of the word).

## Creating Hashes

**`hash1.rb`**:

You can create a hash by creating a new instance of the Hash class:

```ruby
h1 = Hash.new
h2 = Hash.new("Some kind of ring")
hash1.rb
```

Both the examples above create an empty `Hash`. A `Hash` object always has a default value – that is, a value that is returned when no specific value is found at a given index. In these examples, `h2` is initialized with the default value, `"Some kind of ring"`; `h1` is not initialized with a value so its default value will be nil.

Having created a Hash object, you can add items to it using an array-like syntax – that is, by placing the index in square brackets and using `=` to assign a value.

The obvious difference here being that, with an array, the index (the ‘key’) must be an integer; with a Hash, it can be any unique data item:

```ruby
h2['treasure1'] = 'Silver ring'
h2['treasure2'] = 'Gold ring'
h2['treasure3'] = 'Ruby ring'
h2['treasure4'] = 'Sapphire ring'
```

Often, the key may be a number or, as in the code above, a string. In principle, however, a key can be any type of object. Given some class, `X`, the following assignment is perfectly legal:

```ruby
x1 = X.new('my Xobject')
h2[x1] = 'Diamond ring'
```

There is a shorthand way of creating Hashes and initializing them with key- value pairs. Just add a key followed by `=>` and its associated value; each key- value pair should be separated by a comma and the whole lot placed inside a pair of curly brackets:

```ruby
h1 = {
    'room1' => 'The Treasure Room',
    'room2' => 'The Throne Room',
    'loc1' => 'A Forest Glade',
    'loc2' => 'A Mountain Stream' }
```

> ### Unique Keys?
> 
> Take care when assigning keys to Hashes. If you use the same key twice in a Hash, you will end up over-writing the original value. This is just like assigning a value twice to the same index in an array. Consider this example:
> 
> ```ruby
> h2['treasure1'] = 'Silver ring'
> h2['treasure2'] = 'Gold ring'
> h2['treasure3'] = 'Ruby ring'
> h2['treasure1'] = 'Sapphire ring'
> ```
> 
> Here the key ‘treasure1’ has been used twice. As a consequence, the original value, ‘Silver ring’ has been replaced by ‘Sapphire ring’, resulting in this Hash:
> 
> ```ruby
> { "treasure1" => "Sapphire ring", "treasure2" => "Gold ring", "treasure3" => "Ruby ring"}
> ```

## Indexing Into A Hash

To access a value, place its key between square brackets:

```ruby
puts(h1['room2']) #=> "The Throne Room"
```

If you specify a key that does not exist, the default value is returned. Recall that we have not specified a default value for `h1` but we have for `h2`:

```ruby
p(h1['unknown_room'])       #=> nil
p(h2['unknown_treasure'])   #=> 'Some kind of ring'
```

Use the `default` method to get the default value and the `default=` method to
 set it (see Chapter 4 for more information on _get_ and _set_ methods):

```ruby
p(h1.default)
h1.default = 'A mysterious place'
```

## Hash Operations

**`hash2.rb`**:

The `keys` and `values` methods of `Hash` each return an array so you can use various Array methods to manipulate them. Here are a few simple examples (note, the data shown in comments beginning `#=>` show the values returned when each piece of code is run):

```ruby
h1 = { 'key1'=>'val1', 'key2'=>'val2', 'key3'=>'val3', 'key4'=>'val4' }
h2 = { 'key1'=>'val1', 'KEY_TWO'=>'val2', 'key3'=>'VALUE_3', 'key4'=>'val4' }

p(h1.keys & h2.keys)          # set intersection (keys)
#=> ["key1", "key3", "key4"]

p(h1.values & h2.values)      # set intersection (values)
#=> ["val1", "val2", "val4"]

p(h1.keys + h2.keys)          # concatenation
#=> ["key1", "key2", "key3", "key4", "key1", "key3", "key4", "KEY_TWO"]

p(h1.values - h2.values)      # difference
#=> ["val3"]

p((h1.keys << h2.keys))     # append
#=> ["key1", "key2", "key3", "key4", ["key1", "key3", "key4", "KEY_TWO"]]

p((h1.keys << h2.keys).flatten.reverse) # "un-nest" arrays and reverse
#=> ["KEY_TWO", "key4", "key3", "key1", "key4", "key3", "key2", "key1"]
```

Be careful to note the difference between concatenating using `+` to add the values from the second array to the first array and appending using `<<` to add the second array itself as the final element of the first array:

```ruby
a =[1,2,3]
b =[4,5,6]
c = a + b       #=> c=[1, 2, 3, 4, 5, 6] a=[1, 2, 3]
a << b          #=> a=[1, 2, 3, [4, 5, 6]]
```

In addition `<<` modifies the first (the _receiver_) array whereas `+` returns a new array but leaves the receiver array unchanged. If, after appending an array with `<<` you decide that you’d like to add the elements from the appended array to the receiver array rather than have the appended array itself _nested_ inside the receiver, you can do this using the `flatten` method:

```ruby
a=[1, 2, 3, [4, 5, 6]]
a.flatten #=> [1, 2, 3, 4, 5, 6]
```
