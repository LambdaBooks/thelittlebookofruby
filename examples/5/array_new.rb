# Приклад програми від www.sapphiresteel.com

# Всі ці записи правильні
arrayob = Array.new([1,2,3])
arrayob = Array.new([1,2,3])
arrayob = Array.new [1,2,3]

# але не цей
arrayob = Array.new[1,2,3]

p(arrayob)
