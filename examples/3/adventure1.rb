# Приклад програми від www.sapphiresteel.com
# Ілюстрація того, як зробити наслідування об’єктів

class Thing
  def initialize(aName, aDescription)
    @name        = aName
    @description = aDescription
  end

  def get_name
    return @name
  end

  def set_name(aName)
    @name = aName
  end

  def get_description
    return @description
  end

  def set_description(aDescription)
    @description = aDescription
  end
end


class Treasure < Thing # Treasure наслідується від Thing
  def initialize(aName, aDescription, aValue)
    super(aName, aDescription)
    @value = aValue
  end

  def get_value
    return @value
  end

  def set_value(aValue)
    @value = aValue
  end
end

# Ось де стартує наша програма…
t1 = Treasure.new("Меч", "ельфійська зброя, викована золотом", 800)
t2 = Treasure.new("Орда Дракона", "величезна купа ювелірних виробів", 550)
puts "Це treasure1: #{t1.inspect}"
puts "Це treasure2: #{t2.inspect}"
puts "t1 name=#{t1.get_name}, description=#{t1.get_description}, value=#{t1.get_value}"
t1.set_value(100)
t1.set_description(" (now somewhat tarnished)")
puts "t1 (NOW) name=#{t1.get_name}, description=#{t1.get_description}, value=#{t1.get_value}"
