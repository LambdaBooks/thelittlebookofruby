# Chapter Ten

> GOING FURTHER...

We’ve covered a lot of ground over the past ten chapters but, even so, we’ve only just begun to explore all the possibilities of programming with Ruby.

One of the areas we haven’t even touched upon is the development of web applications using the Rails framework (popularly known as ‘Ruby On Rails’). The good news is that, developing with Rails will be much easier now that you have a fundamental understanding of programming in Ruby. While Rails has all kinds of tools to get a simple application up and running, trying to program in Rails without understanding Ruby would be like trying to write a novel without being able to speak the language!

## IronRuby and JRuby

We haven’t looked at the features that Ruby brings to specific operating systems either. For example, Sun Microsystems has a Java version of Ruby (JRuby), while Microsoft has a .NET version of Ruby (IronRuby) under development. The commercial ‘Developer’ edition of the Ruby In Steel IDE supports all three major versions of Ruby - standard Ruby, JRuby and IronRuby. There is also a free IronRuby version of Ruby In Steel which includes a visual form design environment similar to those provided with Microsoft’s C# and VB languages. For information on other editions of Ruby In Steel or to download a free IronRuby IDE, visit the SapphireSteel Software web site:

http://www.sapphiresteel.com

## Saving Data

The time has now come to wrap up this Little Book Of Ruby. Let’s do that by looking at one more sample project – a little CD database which lets you create new objects (one for each disc in your CD collection), add them to an array and store them on disk.

In order to save the data to disk I have used Ruby’s YAML library:

```ruby
# saves data to disk in YAML format
def saveDB
    File.open( $fn, 'w' ) { |f|
        f.write($cd_arr.to_yaml)
    }
end
```

## YAML

YAML describes a format for saving data as human-readable text. The data can be subsequently reloaded from disk in order to reconstruct the array of CD objects in memory:

```ruby
def loadDB
    input_data = File.read($fn)
    $cd_arr = YAML::load(input_data)
end
```

Much of the coding in this little program should be familiar from our previous projects. A couple of things need to be highlighted, however.

First, variables beginning with a dollar `$` are ‘global’ so are usable by all the code throughout the program (recall that instance variables, starting with `@`, are only usable within the confines of a specific object; while local variables, starting with a lowercase letter, are only usable within a well-defined ‘scope’ such as within a specific method).

## Files

Also notice that we use the File class to check if a File exists:

```ruby
if File.exist?($fn)
```

Here, `exist?` is a ‘class method’ – that is, it ‘belongs to’ the File class rather than to an instance of the File class. That explains how we can invoke the method from File itself rather than having to invoke it from a new File object. This may remind you of the module methods discussed in Chapter Nine – another example of the similarities between modules and classes.

## Moving On...

The Ruby community is currently a very active one and new projects are constantly emerging. To keep up to date, we suggest that you visit the Sapphire In Steel site (www.sapphiresteel.com) to find links to some of the most useful resources for Ruby programmers. We shall also be adding more tutorials and sample projects to the site to continue our exploration of Ruby programming.

In conclusion, I hope you’ve enjoyed this little introduction to the Ruby language and that it may be just the start of many years of enjoyable and productive Ruby development.
