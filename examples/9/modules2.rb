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

include MyModule
puts(greet)
puts(MyModule.greet)
