# Приклад програми від www.sapphiresteel.com

def showDay(i)
  case(i)
    when 1 : puts("Понеділок")
    when 2 : puts("Вівторок")
    when 3 : puts("Середа")
    when 4 : puts("Четвер")
    when 5 then puts("П’ятниця")
      puts("...майже вихідні!")
    when 6, 7
      puts("Субота!") if i == 6
      puts("Неділя!") if i == 7
      puts("Юху! Вихідні!")
      # все, що нижче ніколи не виконається
    when 5 : puts("А тепер знову п’ятниця!")
    else puts("Такого дня не існує!")
  end
end

for i in 1..8 do
  showDay(i)
end
