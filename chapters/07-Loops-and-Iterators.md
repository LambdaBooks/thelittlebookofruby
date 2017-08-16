# Chapter Seven

> LOOPS AND ITERATORS...

Much of programming is concerned with repetition. You may want a program to beep 10 times, read lines from a file just so long as there are more lines to read or display a warning until the user presses a key. Ruby provides a number of ways of performing this kind of repetition.

## For Loops

In many programming languages, when you want to run a bit of code a certain number of times you can just put it inside a `for` loop. In most languages, you have to give a `for` loop a variable initialized with a starting value which is incremented by 1 on each turn through the loop until it meets some specific ending value. When the ending value is met, the `for` loop stops running. Here’s a version of this traditional type of `for` loop written in Pascal:

```pascal
(* This is Pascal code, not Ruby! *)
for i := 1 to 3 do
    writeln(i);
```

**`for_loop.rb`**:

You may recall from Chapter Five (arrays) that Ruby’s `for` loop doesn’t work like this at all! Instead of giving it a starting and ending value, we give the `for` loop a list of items and it iterates over them, one by one, assigning each value in turn to a loop variable until it gets to the end of the list.

For example, here is a `for` loop that iterates over the items in an array,
displaying each in turn:

```ruby
# This is Ruby code...
for i in [1,2,3] do
    puts(i)
end
```

The `for` loop is more like the _for each_ iterator provided by some other programming languages. Indeed, the author of Ruby describes for as _syntax sugar_ for the each method which is implemented by Ruby's collection types such as `Arrays`, `Sets`, `Hashes` and `Strings` (a `String` being, in effect, a collection of characters).

For the sake of comparison, this is the `for` loop shown above rewritten using the `each` method:

**`each_loop.rb`**:

```ruby
[1,2,3].each do |i|
    puts( i )
end
```

As you can see, there isn’t really all that much difference.

To convert the `for` loop to an `each` iterator, all I’ve had to do is delete `for` and in and append `.each` to the array. Then I’ve put the iterator variable, `i`, between a pair of upright bars after do.

Compare these other examples to see just how similar for loops are to each
 iterators:

**`for_each.rb`**:

```ruby
# --- Example 1 ---

# i) for
for s in ['one','two','three'] do
    puts(s)
end

# ii) each
['one','two','three'].each do |s|
    puts(s)
end

# --- Example 2 ---

# i) for
for x in [1, "two", [3,4,5] ] do puts(x) end

# ii) each
[1, "two", [3,4,5] ].each do |x| puts(x) end
```

Note, incidentally, that the `do` keyword is optional in a for loop that spans
 multiple lines but it is obligatory when it is written on a single line:

```ruby
# Here the "do" keyword can be omitted
for s in ['one','two','three']
    puts(s)
end

# But here it is required
for s in ['one','two','three'] do puts(s) end
```

**`for_to.rb`**:

> ### How to write a _normal_ `for` loop...
> 
> If you miss the traditional type of `for` loop, you can always ‘fake’ it in Ruby by using a `for` loop to iterate over the values in a range. For example, this is how to use a `for` loop variable to count up from 1 to 10, displaying its value at each turn through the loop:
> 
> ```ruby
> for i in (1..10) do
>   puts(i)
> end
> ```
> 
> Which can be rewritten using `each`:
> 
> ```ruby
> (1..10).each do |i|
>   puts(i)
> end
> ```


Note, incidentally, that a range expression such as `1..3` must be enclosed between round brackets when used with the `each` method, otherwise Ruby assumes that you are attempting to use `each` as a method of the final integer (a FixNum) rather than of the entire expression (a Range). The brackets are optional when a range is used in a `for` loop.

When iterating over items using `each` the block of code between `do` and `end` is called (predictably, perhaps?) an _iterator block_.

> **Block Parameters:** In Ruby any variables declared between upright bars at the top of a block are called _block parameters_. In a way, a block works like a function and the block parameters work like a function’s argument list. The each method runs the code inside the block and passes to it the arguments supplied by a collection (for example, an array).

## Blocks

Ruby has an alternative syntax for delimiting blocks. You may use `do..end`, like this…

**`block_syntax.rb`**:

```ruby
# do..end
[[1,2,3],[3,4,5],[6,7,8]].each do |a,b,c|
    puts("#{a}, #{b}, #{c}")
end
```

Or you can use curly braces `{..}` like this:

```ruby
# curly braces {..}
[[1,2,3],[3,4,5],[6,7,8]].each { |a,b,c|
    puts("#{a}, #{b}, #{c}")
}
```

No matter which block delimiters you use, you must ensure that the opening delimiter, `{` or `do`, is placed on the same line as the `each` method. Inserting a line break between `each` and the opening block delimiter is a syntax error.

## While Loops

Ruby has a few other loop constructs too. This is how to do a `while` loop:

```ruby
while tired
    sleep
end
```

Or, to put it another way:

```ruby
sleep while tired
```

Even though the syntax of these two examples is different they perform the same function. In the first example, the code between `while` and `end` (here a call to a method named `sleep`) executes just as long as the Boolean condition (which, in this case, is the value returned by a method called `tired`) evaluates to true.

As in `for` loops the keyword do may optionally be placed between the test condition and the code to be executed when these appear on separate lines; the `do` keyword is obligatory when the test condition and the code to be executed appear on the same line.

## While Modifiers

In the second version of the loop (`sleep while tired`), the code to be executed (`sleep`) precedes the test condition (`while tired`). This syntax is called a _while modifier_. When you want to execute several expressions using this syntax, you can put them between the `begin` and `end` keywords:

```ruby
begin
    sleep
    snore
end while tired
```

This is an example showing the various alternative syntaxes:

**`while.rb`**:

```ruby
$hours_asleep = 0

def tired
    if $hours_asleep >= 8 then
        $hours_asleep = 0
        return false
    else
        $hours_asleep += 1
        return true
    end
end

def snore
    puts('snore....')
end

def sleep
    puts("z" * $hours_asleep)
end

while tired do sleep end    # a single-line while loop

while tired                 # a multi-line while loop
    sleep
end

sleep while tired           # single-line while modifier

begin                       # multi-line while modifier
    sleep
    snore
end while tired
```

The last example above (the multi-line `while` modifier) needs close consideration as it introduces some important new behaviour. When a block of code delimited by `begin` and `end` precedes the `while` test, that code always executes at least once. In the other types of `while` loop, the code may never execute at all if the Boolean condition initially evaluates to true.

**`while2.rb`**:

> ### Ensuring a Loop Executes At Least Once
> 
> Usually a `while` loops executes 0 or more times since the Boolean test is evaluated _before_ the loop executes; if the test returns false at the outset, the code inside the loop never runs.
> 
> However, when the `while` test follows a block of code enclosed between `begin` and `end`, the loop executes 1 or more times as the Boolean expression is evaluated after the code inside the loop executes.
> 
> To appreciate the differences in behaviour of these two types of `while` loop, run **`while2.rb`**. These examples should help to clarify:
> 
> ```ruby
> x = 100
> 
> # The code in this loop never runs
> while (x < 100) do puts('x < 100') end
> 
> # The code in this loop never runs
> puts('x < 100') while (x < 100)
> 
> # But the code in loop runs once
> begin puts('x < 100') end while (x < 100)
> ```

## Until Loops


Ruby also has an `until` loop which can be thought of as a _while not_ loop. Its syntax and options are the same as those applying to while – that is, the test condition and the code to be executed can be placed on a single line (in which case the `do` keyword is obligatory) or they can be placed on separate lines (in which case `do` is optional). There is also an `until` modifier which lets you put the code before the test condition; and there is the option of enclosing the code between `begin` and `end` in order to ensure that the code block is run at least once.

**`until.rb`**:

Here are some simple examples of `until` loops:

```ruby
i = 10

until i == 10 do puts(i) end    # never executes

until i == 10                   # never executes
    puts(i)
    i += 1
end

puts(i) until i == 10           # never executes

begin                           # executes once
    puts(i)
end until i == 10
```

Both `while` and `until` loops can, just like a `for` loop, be used to iterate over arrays and other collections. For example, this is how to iterate over all the elements in an array:

```ruby
while i < arr.length
    puts(arr[i])
    i += 1
end

until i == arr.length
    puts(arr[i])
    i +=1
end
```
