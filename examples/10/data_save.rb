# Приклад програми від www.sapphiresteel.com

require 'yaml'

# Масив об’єктів CD
$cd_arr = Array.new

# Ім’я файлу для збереження і завантаження
$fn = 'cd_db.yml'

# Нащадок загального CD класу
class CD
  # ініціалізуємо змінні, які передаються першим аргументом
  # у вигляді масиву (arr)
  def initialize(arr)
    @name      = arr[0]
    @artist    = arr[1]
    @numtracks = arr[2]
  end

  # повертаємо масив масив, який містить всі змінні екземпляру
  # поточного об’єкту CD
  def getdetails
    return [@name, @artist, @numtracks]
  end
end

# PopCD це 'нащадок' класу CD
class PopCD < CD
  # Виклаємо super, щоб передати масив arr у батьківський клас (CD)
  # Це ініціалізує три змінних екземпляра. Цей
  # метод ініціалізує ще одну: @genre
  def initialize(arr)
    super(arr)
    @genre = arr[3]
  end

  # Викликаємо super, щоб отримати масив з, який повертає матод
  # getdetails класу CD. Тоді додаємо у кінець цього масиву @genre
  # та повертаємо весь чотирьохелементний масив
  def getdetails
    return (super << @genre)
  end
end

class ClassicalCD < CD
  def initialize(arr)
    super(arr)
    @conductor = arr[3]
    @composer  = arr[4]
  end

  def getdetails
    return (super << @conductor << @composer)
  end
end

# Кілька методів, щоб отримувати данні від користувача
def otherCD
  print("Введіть ім’я CD: ")
  cd_name = gets().chomp()
  print("Введіть назву виконався: ")
  a_name = gets().chomp()
  print("Введіть кількість треків: ")
  num_tracks = gets().chomp().to_i
  return [cd_name, a_name, num_tracks]
end

def classicCD
  cdInfo= otherCD
  print("Введіть ім’я деригента: ")
  con_name= gets().chomp()
  print("Введіть ім’я композитора: ")
  comp_name = gets().chomp()
  cdInfo << con_name << comp_name
  return cdInfo
end

def popCD
  cdInfo= otherCD
  print("Введіть музичний жанр: ")
  genre = gets().chomp()
  cdInfo << genre
  return cdInfo
end

# Додаємо об’єкт CD у масив $cd_arr
def addCD(aCD)
  $cd_arr << aCD
end

# Зберігаємо дані на диск у форматі YAML
# метод to_yaml перетворює у формат YAML
def saveDB
  File.open($fn, 'w') { |f|
    f.write($cd_arr.to_yaml)
  }
end

# Завантажуємо данні з диску та відтворюємо з даних
# масив $cd_arr об’єктів CD
def loadDB
  input_data = File.read($fn)
  $cd_arr = YAML::load(input_data)
end

# Виводимо дані з масиву на екран у зрозумілому для людей
# форматі (YAML)
def showData
  puts($cd_arr.to_yaml)
end

# Початок програми

if File.exist?($fn) then
  loadDB
  showData
else
  puts("Файл #{$fn} не знайдено.")
end

# 'main' loop
ans = ''
until ans == 'q' do
  puts("Create (P)op CD (C)lassical CD, (O)ther CD - (S)ave or (Q)uit?")
  print("> ")
  ans = gets[0].chr().downcase()
  case ans
    when 'p' then addCD(PopCD.new(popCD()))
    when 'c' then addCD(ClassicalCD.new(classicCD()))
    when 'o' then addCD(CD.new(otherCD()))
    when 's' then saveDB
  end
  showData
end
