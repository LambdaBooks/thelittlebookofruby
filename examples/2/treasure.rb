# Приклад програми від www.sapphiresteel.com
# Визначення класу та створення декількох об’єктів

class Thing
  def set_name(aName)
    @name = aName
  end

  def get_name
    return @name
  end
end

class Treasure
  def initialize(aName, aDescription)
    @name        = aName
    @description = aDescription
  end

  def to_s # перезаписує метод to_s за замовчуванням
    "Скарб #{@name} — це #{@description}\n"
  end
end

thing1 = Thing.new
thing1.set_name("Прекрасна річ")
puts thing1.get_name

t1 = Treasure.new("Меч", "ельфійська зброя, викована золотом")
t2 = Treasure.new("Кільце", "магічне кільце великої влади")
puts t1.to_s
puts t2.to_s
# Метод inspect дозволяє вам заглянути всередину об’єкта
puts "Інспектуємо 1й скарб: #{t1.inspect}"
