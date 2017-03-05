# Chapter five

> Arrays

Up to now, we've generally been using objects one at a time. In this chapter we'll find out how to create a list of objects. We'll start by looking at the most common type of list structure - an array.

**`array0.rb`**:

> ### Using Arrays
>
> What is an Array?
>
> An Array is a sequential collection of items in which each item can be indexed.
>
> In Ruby, (unlike many other languages) a single Array can hold items of mixed data types such as strings, integers and floats or even a method-call which returns some value:
>
> ```ruby
> a1 = [1,'two', 3.0, array_length( a0 ) ]
> ```
>
> The first item in an array has the index 0, which means that the final item has an index equal to the total number of items in the array minus 1. Given the array, a1, shown above, this is how to obtain the values of the first and last items:
>
> ```ruby
> a1[0] # returns 1st item (at index 0)
> a1[3] # returns 4th item (at index 3)
> ```

We’ve already used arrays a few times – for example, in **adventure2.rb** in chapter 4 we used an array to store a map of Rooms:

```ruby
mymap = Map.new([room1,room2,room3])
```

## Creating Arrays

In common with many other programming languages, Ruby uses square brackets to delimit an array. You can easily create an array, fill it with some comma-delimited values and assign it to a variable:

**`array1.rb`**:

```ruby
arr = ['one','two','three','four']
```

As with most other things in Ruby, arrays are objects. They are defined, as you might guess, by the Array class and, just like strings, they are indexed from 0.

You can reference an item in an array by placing its index between square brackets. If the index is invalid, **nil** is returned:

**`array2.rb`**:

```ruby
arr = ['a', 'b', 'c']

puts(arr[0]) # shows 'a'
puts(arr[1]) # shows 'b'
puts(arr[2]) # shows 'c'

puts(arr[3]) # nil
```

It is permissible to mix data types in an array and even to include expressions which yield some value. Let’s assume that you have already created this method:

```ruby
def hello
  return "hello world"
end
```

You can now declare this array:

```ruby
x = [1+2, hello, `dir`]
```

Here, the first element is the integer, 3 and the second is the string "hello world" (returned by the method **hello**). If you run this on Windows, the third array element will be a string containing a directory listing. This is due to the fact that **\`dir\`** is a back-quoted string which is executed by the operating system. The final ‘slot’ in the array is, therefore, filled with the value returned by the **dir** command which happens to be a string of file names. If you are running on a different operating system, you may need to substitute an appropriate command at this point.

**`div_array.rb`**:

> ### Creating an Array of File Names:
>
> A number of Ruby classes have methods which return arrays of values. For example, the Dir class, which is used to perform operations on disk directories, has the **entries** method. Pass a directory name to the method and it returns a list of files in an array:
>
> ```ruby
> Dir.entries( 'C:\\' ) # returns an array of files in C:\
> ```

If you want to create an array of strings but can’t be bothered typing all the quotation marks, a shortcut is to put unquoted text separated by spaces between round brackets preceded by **%w** like this:

```ruby
y = %w( this is an array of strings )
```

You can also create arrays using the usual object construction method, **new**. Optionally, you can pass an integer to **new** to create an empty array of a specific size (with each element set to nil), or you can pass two arguments – the first to set the size of the > array and the second to specify the element to place at each index of the array, like this:

```ruby
a = Array.new                   # an empty array
a = Array.new(2)                # [nil,nil]
a = Array.new(2,"hello world")  # ["hello world","hello world"]
```

## Multi-Dimensional Arrays

To create a multi-dimensional array, you can create one array and then add other arrays to each of its ‘slots’. For example, this creates an array containing two elements, each of which is itself an array of two elements:

```ruby
a = Array.new(2)
a[0]= Array.new(2,'hello')
a[1]= Array.new(2,'world')
```

Or you could nest arrays inside one another using square brackets. This creates an array of four arrays, each of which contains four integers:

```ruby
a = [ [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16] ]
```

In the code shown above, I have placed the four ‘sub-arrays’ on separate lines. This is not obligatory but it does help to clarify the structure of the multidimensional array by displaying each sub-array as though it were a row, similar to the rows in a spreadsheet. When talking about arrays within arrays, it is convenient to refer to each nested array as a ‘row’ of the ‘outer’ array.

**`array_new.rb`**:

> You can also create an Array object by passing an array as an argument to the **new** method. Be careful, though. It is a quirk of Ruby that, while it is legitimate to pass an array argument either with or without enclosing round brackets, Ruby considers it a syntax error if you fail to leave a space between the **new** method and the opening square bracket – another good reason for making a firm habit of using brackets when passing arguments!

**`multi_array.rb`**:

For some examples of using multi-dimensional arrays, load up the **multi_array.rb** program. This starts by creating an array, **multiarr**, containing two other arrays. The first of these arrays is at index 0 of **multiarr** and the second is at index 1:

```ruby
multiarr = [['one','two','three','four'],[1,2,3,4]]
```

## Iterating Over Arrays

You can access the elements of an array by iterating over them using a **for** loop. The loop will iterate over two elements here: namely, the two sub-arrays at index 0 and 1:

```ruby
for i in multiarr
puts(i.inspect)
end
```

This displays:

```ruby
["one", "two", "three", "four"]
[1, 2, 3, 4]
```

> **Iterators and for loops**: The code inside a **for** loop is executed for each > element in an expression. The syntax is summarized like this:
>
> ```ruby
> for <one or more variables> in <expression> do
> <code to run>
> end
> ```
>
> When more than one variable is supplied, these are passed to the code inside the > **for..end** block just as you would pass arguments to a method. Here, for example, > you can think of **(a,b,c,d)** as four arguments which are initialised, at each > turn through the **for** loop, by the four values from a row of **multiarr**:
>
> ```ruby
> for (a,b,c,d) in multiarr
>  print("a=#{a}, b=#{b}, c=#{c}, d=#{d}\n" )
> end
> ```

## Indexing Into Arrays

You can index from the end of an array using minus figures, where -1 is the index of the last element; and you can also use ranges (values between a start index and an end index separated by two dots):

**`array_index.rb`**:

```ruby
arr = ['h','e','l','l','o',' ','w','o','r','l','d']

print( arr[0,5] )     #=> „hello‟
print( arr[-5,5 ] )   #=> „world‟
print( arr[0..4] )    #=> „hello‟
print( arr[-5..-1] )  #=> „world‟
```

Notice that, as with strings, when provided with two integers in order to return a number of contiguous items from an array, the first integer is the start index while the second is a count of the number of items (not an index):

```ruby
arr[0,5] # returns 5 chars - ["h", "e", "l", "l", "o"]
```

You can also make assignments by indexing into an array. Here, for example, I first create an empty array then put items into indexes 0, 1 and 3. The ‘empty’ slot at number 2 will be filled with a **nil** value:

**`array_assign.rb`**:

```ruby
arr = []

arr[0] = [0]
arr[1] = ["one"]
arr[3] = ["a", "b", "c"]
# arr now contains:
# [[0], ["one"], nil, ["a", "b", "c"]]
```

Once again, you can use start-end indexes, ranges and negative index values:
```ruby
arr2 = ['h','e','l','l','o',' ','w','o','r','l','d']

arr2[0] = 'H'
arr2[2,2] = 'L', 'L'
arr2[4..6] = 'O','-','W'
arr2[-4,4] = 'a','l','d','o'

# arr2 now contains:
# ["H", "e", "L", "L", "O", "-", "W", "a", "l", "d", "o"]
```
