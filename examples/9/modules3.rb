# Приклад програми від www.sapphiresteel.com

module MyModule
  GOODMOOD = "веселий"
  BADMOOD = "сварливий"

  def greet
    return "Я #{GOODMOOD}. А ти як?"
  end

  def MyModule.greet
    return "Я #{BADMOOD}. А ти як?"
  end
end

class MyClass
  include MyModule

  def sayHi
    puts(greet)
  end

  def sayHiAgain
    puts(MyModule.greet)
  end
end

ob = MyClass.new
ob.sayHi
ob.sayHiAgain
puts(ob.greet)
