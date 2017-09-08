# Приклад програми від www.sapphiresteel.com
# Читання та запис атрибутів

class Thing
  attr_reader :description
  attr_writer :description
  attr_writer :name

  def initialize(aName, aDescription)
    @name         = aName
    @description  = aDescription
  end

  # get-аксесор для @name
  def name
    return @name.capitalize
  end

# Цей set-методи для name вже не потрібний, оскільки я вже маю attr_writer
# def name=(aName)
#   @name = aName
# end
end


class Treasure < Thing # Treasure наслідується від Thing
  attr_accessor :value

  def initialize(aName, aDescription)
    super(aName, aDescription)
  end
end

# Тут наша програма починає виконуватись...
t1 = Treasure.new("Меч", "ельфійська зброя, викована золотом")
t1.value = 800
t2 = Treasure.new("Орда Дракона", "величезна купа ювелірних виробів")
t2.value = 500
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
t1.value= 100
t1.description << " (зараз трохи брудний)" # тут << додає певний рядок в кінець заданого рядка
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts "Це treasure1: #{t1.inspect}"
puts "Це treasure2: #{t2.inspect}"
