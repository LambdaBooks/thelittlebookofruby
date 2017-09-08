# Приклад програми від www.sapphiresteel.com

arr = ['h','e','l','l','o',' ','w','o','r','l','d']

# Тут ми виводимо коже символ у послідовності
print(arr[0,5])
puts
print(arr[-5,5 ])
puts
print(arr[0..4])
puts
print(arr[-5..-1])

puts

# Ось як ми інспектуємо символи. Зауважте як ми можемо
# зветатись за індексом у масиві…
#	arr[<start index>, <number of items>]
# або вказувати діапазон ось так…
#	arr[<start index> .. <end index> ]
#
# Тому ці два записи еквівалентні:

p(arr[0,5])
p(arr[0..4])
