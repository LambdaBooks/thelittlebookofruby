# Приклад програми від www.sapphiresteel.com
# Ілюструє як можна зчитувати та записувати змінні екземплярів
# використовуючи методи-аксесори

class Thing
  def initialize(aName, aDescription)
    @name        = aName
    @description = aDescription
  end

  # get-аксесор для @name
  def name
    return @name
  end

  # set-аксесор для @name
  def name=(aName)
    @name = aName
  end

  # get-аксесор для @description
  def description
    return @description
  end

  # set-аксесор для @description
  def description=(aDescription)
    @description = aDescription
  end
end

t = Thing.new("Річ", "чудова, блискуча")
print(t.name)
print(" є ")
puts(t.description)
t.name = "Відновлена річ"
t.description = "трохи зношена і побита по боках"
print("Тепер вона змінила своє ім’я на ")
puts(t.name)
print("Вона ")
puts(t.description)
