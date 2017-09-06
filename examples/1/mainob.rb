# Приклад програми від www.sapphiresteel.com

def showstring
  puts("Привіт")
end

def showname(aName)
  puts("Привіт #{aName}")
end

def return_name(aFirstName, aSecondName)
  return "Привіт #{aFirstName} #{aSecondName}"
end

def return_name2 aFirstName, aSecondName
  return "Привіт #{aFirstName} #{aSecondName}"
end


# тож який об’єкт, зрештою, володіє цими методами?
# Така перевірка демонструє це...
print("'Вільні методи' у цьому коді належать об’єкту з ім’ям: ")
puts(self)
print("який є екземпляром класу: ")
puts(self.class)

# Вільні методи (як ті, що визначені вище, тобто не належать
# певному класу) стають матодами (строго кажучи, 'приватними' методами)
# класу Object. Ruby створює об’єкт 'main' автоматично.
# Наступний код показує відсортований список приватних методів, які
# доступні в об’єкті 'main'. Подивіться уважно і ви знайдете у цьому списку
# showname, return_name та return_name2.
puts("It contains these private methods: ")
puts(self.private_methods.sort)

# Просто, щоб довести, що ці методи справді зв’язані з самим скласом Object,
# розкоментуйте код нижче і ви побачите, що showname, return_name
# та return_name2 також можна знайти серез приватних методів класу Object!
#
#
# puts(Object.private_methods.sort)
