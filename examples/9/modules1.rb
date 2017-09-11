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

puts("  MyModule::GOODMOOD")
puts(MyModule::GOODMOOD)
puts("  MyModule.greet")
puts(MyModule.greet)
