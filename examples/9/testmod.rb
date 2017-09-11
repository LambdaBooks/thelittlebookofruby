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

  def sayHi
    return greet
  end

  def sayHiAgain
    return MyModule.greet
  end
end

def sing
  puts("Тра-ла-ла-ла-ла....")
end

puts("модуль завантажено")
sing
