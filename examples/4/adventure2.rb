# Приклад програми від www.sapphiresteel.com
# Ілюструє створення нащадків об’єктів
# читання та запис атрибутів
# змінних об’єктів (екземплярів)
# змінних класів

# Thing (Річ)
class Thing
  @@num_things = 0 # змінна класу

  attr_reader(:name, :description)
  attr_writer(:description)

  def initialize(aName, aDescription)
    @name         = aName
    @description  = aDescription
    @@num_things +=1 # збільшуємо @@num_things на 1
  end

  def to_s # перезаписуємо метод to_s за замовчуванням
    return "(Thing.to_s):: Річ #{@name} є #{@description}"
  end

  def show_classvars
    return "Є #{@@num_things} об’єків класу Thing у цій грі"
  end
end

# Room (Кімната)
class Room < Thing
  # TODO: Додати специфічну для Room поведінку
end

# Treasure (Скарб)
class Treasure < Thing
  attr_reader :value
  attr_writer :value

  def initialize(aName, aDescription, aValue)
    super(aName, aDescription)
    @value = aValue
  end
end


# Map (Карта)
class Map
  # @rooms буде масивом - впорядкованим списком
  # всіх об’єктів класу Room
  def initialize(someRooms)
    @rooms = someRooms
  end

  # Метод to_s ітерується по всіх об’єктах Room у @rooms
  # та виводить інформацію про кожного з них. Ми повернемось до
  # імплементації цього методу трохи згодом
  def to_s
    @rooms.each { |a_room|
      puts(a_room)
    }
  end
end

# Для початку сторимо кілька об’єктів
# i) Скарби
t1 = Treasure.new("Меч", "ельфійська зброя, викована золотом",800)
t2 = Treasure.new("Орда Дракона", "величезна купа ювелірних виробів", 550)
# ii) Кімнати
room1 = Room.new("Кришталевий грот", "блискуча печера")
room2 = Room.new("Темна печера", "похмура діра в скелях")
room3 = Room.new("Лісова поляна", "Зелена галявина заповнена мерехтливим світлом")
# іii) Карта - є масивом, що містить всі створені кімнати
mymap = Map.new([room1,room2,room3])
# Тепер давайте подивимося, що у нас є…
puts "\nДавайте подивимось на скарби..."
puts "Це treasure1: #{t1.inspect}"
puts "Це treasure2: #{t2.inspect}"
puts "\nДавайте спробуємо метод Thing.to_s…"
puts "Так, treasure2 це #{t2.to_s}"
puts "\nТепер давайте подивимось як працюють наші аксесори атрибутів"
puts "Ми виконаємо ось це:"
puts 't1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}'
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts "\nТепер ми присвоємо у t1.value значення 100 та розширимо t1.description..."
t1.value = 100
t1.description << " (зараз трохи брудний)" # note << appends specified string to existing string
puts "t1 (NOW) name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts "\nДавайте подивимось на room1..."
puts "room1 name=#{room1.name}, description=#{room1.description}"
puts "\nІ на map..."
puts "mymap = #{mymap.to_s}"
puts "\nНарешті, давайте подивимось як багато об’єктів Thing ми створили…"
puts(t1.show_classvars)

# В якості вправи, додайте змінну класу в клас Map, щоб зберігати
# загальну кількість кімнат, які були створені
