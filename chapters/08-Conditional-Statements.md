## Chapter Eight

> CONDITIONAL STATEMENTS...

Computer programs, like Life Itself, are full of difficult decisions waiting to be made. Things like: If I stay in bed I will get more sleep, else I will have to go to work; if I go to work I will earn some money, else I will lose my job - and so on…

We’ve already performed a number of if tests in previous programs. To take a simple example, this is from the Tax calculator in chapter one:

```ruby
if (subtotal < 0.0) then
    subtotal = 0.0
end
```

In this program, the user was prompted to enter a value, `subtotal`, which was then used in order to calculate the tax due on it. The little test above ensures that `subtotal` is never a minus figure. If the user, in a fit of madness, enters a value less than `0`, the if test spots this since the condition (`subtotal < 0.0`) evaluates to true, which causes the body of the code between the if test and the end keyword to be executed; here, this sets the value of `subtotal` to `0`.

> ### Equals once = or equals twice == ?
> 
> In common with many other programming languages, Ruby uses one equals sign to assign a value `=` and two to test a value `==`.

## If..Then..Else

**`if_else.rb`**:

A simple if test has only one of two possible results. Either a bit of code is run or it isn’t, depending on whether the test evaluates to true or not.

Often, you will need to have more than two possible outcomes. Let’s suppose, for example, that your program needs to follow one course of action if the day is a weekday and a different course of action if it is a weekend. You can test these conditions by adding an `else` section after the if section, like this:

```ruby
if aDay == 'Saturday' or aDay == 'Sunday'
    daytype = 'weekend'
else
    daytype = 'weekday'
end
```

The `if` condition here is straightforward. It tests two possible conditions:

1. if the value of the variable, `aDay` is equal to the string `'Saturday'` or…
2. if the value of `aDay` is equal to the string `'Sunday'`.

If either of those conditions is true then the next line of code executes:

```ruby
daytype = 'weekend'
```

In all other cases, the code after `else` executes:

```ruby
daytype = 'weekday'
```

**`if_then.rb`**:

> When an `if` test and the code to be executed are placed on separate lines, the `then` keyword is optional. When the test and the code are placed on a single line, the `then` keyword (or, if you prefer really terse code, a colon character) is obligatory:
> 
> ```ruby
> if x == 1 then puts('ok') end    # with 'then' 
> if x == 1 : puts('ok') end       # with colon
> if x == 1 puts('ok') end         # syntax error!
> ```

An `if` test isn’t restricted to evaluating just two conditions. Let’s suppose, for example, that your code needs to work out whether a certain day is a working day or a holiday. All weekdays are working days; all Saturdays are holidays but Sundays are only holidays when you are not working overtime.

This is my first attempt to write a test to evaluate all these conditions:

```ruby
working_overtime = true

if aDay == 'Saturday' or aDay == 'Sunday' and not working_overtime
    daytype = 'holiday'
    puts( "Hurrah!" )
else
    daytype = 'working day'
end
```

**`and_or.rb`**:

Unfortunately, this doesn’t have quite the effect intended. Remember that Saturday is always a holiday. But this code insists that ‘Saturday’ is a working day. This is because Ruby takes the test to mean: _“If the day is Saturday and I am not working overtime, or if the day is Sunday and I am not working overtime”_ whereas what I really meant was _“If the day is Saturday; or if the day is Sunday and I am not working overtime”_.

The easiest way to resolve this ambiguity is to put brackets around any code to be evaluated as a single unit, like this:

```ruby
if aDay == 'Saturday' or (aDay == 'Sunday' and not working_overtime)
```

## And..Or..Not

Incidentally, Ruby has two different syntaxes for testing Boolean (true/false) conditions.

In the above example, I’ve used the English-language style operators: `and`, `or` and `not`. If you prefer you could use alternative operators similar to those used in many other programming languages, namely: `&&` (and), `||` (or) and `!` (not).

Be careful, though, the two sets of operators aren’t completely interchangeable. For one thing, they have different precedence which means that when multiple operators are used in a single test, the parts of the test may be evaluated in different orders depending on which operators you use.

## If..Elsif

There will no doubt be occasions when you will need to take multiple different actions based on several alternative conditions. One way of doing this is by evaluating one `if` condition followed by a series of other test conditions placed after the keyword `elsif`. The whole lot must then be terminated using the `end` keyword.

**`if_elsif.rb`**:

For example, here I am repeatedly taking input from a user inside a `while` loop; an if condition tests if the user enters `'q'` (I’ve used the `chomp()` method to remove the carriage return from the input); if `'q'` is not entered the first `elsif` condition tests if the integer value of the input (`input.to_i`) is greater than 800; if this test fails the next `elsif` condition tests if it is less than or equal to 800:

```ruby
while input != 'q' do
    puts("Enter a number between 1 and 1000 (or 'q' to quit)")
    print("?- ")
    input = gets().chomp()
    if input == 'q'
        puts("Bye")
    elsif input.to_i > 800
        puts("That's a high rate of pay!")
    elsif input.to_i <= 800
        puts("We can afford that")
    end
end
```

> This code has a bug. It asks for a number between 1 and 1000 but it accepts other numbers. See if you can rewrite the tests to fix this!

**`if_else_alt.rb`**:

> Ruby also has a short-form notation for `if..then..else` in which a question mark `?` replaces the `if..then` part and a colon `:` acts as `else`…
> 
> ```
> <Test Condition> ? <if true do this> : <else do this>
> ```
> 
> For example:
> 
> ```ruby
> x == 10 ? puts("it's 10") : puts("it's some other number")
> ```
> 
> When the test condition is complex (if it uses `and`s and `or`s) you should enclose it in brackets.
> 
> If the tests and code span several lines the `?` must be placed on the same line as the preceding condition and the `:` must be placed on the same line as the code immediately following the `?`.
> 
> In other words, if you put a newline before the `?` or the `:` you will generate a syntax error. This is an example of a valid multi-line code block:
> 
> ```ruby
> (aDay == 'Saturday' or aDay == 'Sunday') ?
>   daytype = 'weekend' :
>   daytype = 'weekday'
> ```

## Unless

**`unless.rb`**:

Ruby also can also perform `unless` tests, which are the opposite of `if` tests:

```ruby
unless aDay == 'Saturday' or aDay == 'Sunday'
    daytype = 'weekday'
else
    daytype = 'weekend'
end
```

Think of `unless` as being an alternative way of expressing _if not_. The
following is equivalent to the code above:

```ruby
if !(aDay == 'Saturday' or aDay == 'Sunday')
    daytype = 'weekday'
else
    daytype = 'weekend'
end
```

## If and Unless Modifiers

You may recall the alternative syntax for `while` loops in Chapter 7. Instead of writing this…

```ruby
while tired do sleep end
```

…we can write this:

```ruby
sleep while tired
```

This alternative syntax, in which the `while` keyword is placed between the code to execute and the test condition is called a _while modifier_. It turns out that Ruby has `if` and `unless` modifiers too. Here are a few examples:

**`if_unless_mod.rb`**:

```ruby
sleep if tired

begin
    sleep
    snore
end if tired

sleep unless not tired

begin
    sleep
    snore
end unless not tired
```

The terseness of this syntax is useful when, for example, you repeatedly need to take some well-defined action if some condition is true.

This is how you might pepper your code with debugging output if a constant called `DEBUG` is true:

```ruby
puts("somevar = #{somevar}") if DEBUG
```

## Case Statements

When you need to take a variety of different actions based on the value of a single variable, multiple `if..elsif` tests are verbose and repetitive. A neater alternative is provided by a `case` statement. This begins with the word `case` followed by the variable name to test. Then comes a series of `when` sections, each of which specifies a ‘trigger’ value followed by some code. This code executes only `when` the test variable equals the trigger value:

**`case.rb`**:

```ruby
case(i)
    when 1 : puts("It's Monday")
    when 2 : puts("It's Tuesday")
    when 3 : puts("It's Wednesday")
    when 4 : puts("It's Thursday")
    when 5 : puts("It's Friday")
    when (6..7) : puts("Yippee! It's the weekend! ")
    else puts("That's not a real day!")
end
```

In the example above, I’ve used colons to separate each `when` test from the
code to execute. Alternatively, you could use the `then` keyword:

```ruby
when 1 then puts("It's Monday")
```

The colon or `then` can be omitted if the test and the code to be executed are on separate lines. Unlike `case` statements in C-like languages, there is no need to enter a `break` keyword when a match is made in order to prevent execution trickling down through the remainder of the sections.

In Ruby, once a match is made the `case` statement exits:

```ruby
case(i)
    when 5 : puts("It's Friday")
        puts("...nearly the weekend!")
    when 6 : puts("It's Saturday!")
        # the following never executes
    when 5 : puts("It's Friday all over again!")
end
```

You can include several lines of code between each `when` condition and you can include multiple values separated by commas to trigger a single `when` block, like this:

```ruby
when 6, 7 : puts( "Yippee! It's the weekend! " )
```

The condition in a `case` statement is not obliged to be a simple variable; it can be an expression like this:

```ruby
case(i + 1)
```

You can also use non-integer types such as string.

If multiple trigger values are specified in a `when` section, they may be of varying types – for example, both string and integers:

```ruby
when 1, 'Monday', 'Mon' : puts("Yup, '#{i}' is Monday")
```

**`case2.rb`**:

Here is a longer example, illustrating some of the syntactical elements mentioned earlier:

```ruby
case(i)
    when 1 : puts("It's Monday")
    when 2 : puts("It's Tuesday")
    when 3 : puts("It's Wednesday")
    when 4 : puts("It's Thursday")
    when 5 then puts("It's Friday")
        puts("...nearly the weekend!")
    when 6, 7
        puts("It's Saturday!") if i == 6
        puts("It's Sunday!") if i == 7
        puts("Yippee! It's the weekend!")
            # the following never executes
    when 5 : puts("It's Friday all over again!")
    else puts("That's not a real day!")
end
```
