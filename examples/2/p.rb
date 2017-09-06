# Приклад програми від www.sapphiresteel.com

class Treasure
  def initialize(aName, aDescription)
    @name        = aName
    @description = aDescription
  end

  def to_s # перезаписує метод to_s за замовчуванням
    "Скарб #{@name} — це #{@description}\n"
  end
end

a = "привіт"
b = 123
c = Treasure.new("кільце", "блискуча золота річ")

p(a)
p(b)
p(c)
