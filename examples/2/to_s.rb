# Приклад програми від www.sapphiresteel.com
# Показуємо рядкове представлення для різних об’єктів
# з використанням методу to_s

class Treasure
  def initialize(aName, aDescription)
    @name        = aName
    @description = aDescription
  end
  # Тут ми не перевизначатимемо метод `to_s`
  # тому об'єкти цього класу використовуватимуть стандартний метод `to_s`
end

t = Treasure.new("Меч", "чудова ельфійська зброя")
print("Class.to_s: ")
puts(Class.to_s)
print("Object.to_s: ")
puts(Object.to_s)
print("String.to_s: ")
puts(String.to_s)
print("100.to_s: ")
puts(100.to_s)
print("Treasure.to_s: ")
puts(Treasure.to_s)
print("t.to_s: ")
puts(t.to_s)
print("t.inspect: ")
puts(t.inspect)
