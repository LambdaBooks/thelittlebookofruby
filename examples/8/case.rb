# Приклад програми від www.sapphiresteel.com

def showDay(i)
  case(i)
    when 1 : puts("Понеділок")
    when 2 : puts("Вівторок")
    when 3 : puts("Середа")
    when 4 : puts("Четвер")
    when 5 : puts("П’ятниця")
    when (6..7) : puts("Юху! Вихідні!")
    else puts("Такого дня не існує!")
  end
end

for i in 1..8 do
  showDay(i)
end
