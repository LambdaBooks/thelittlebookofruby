# Приклад програми від www.sapphiresteel.com

def dayIs( aDay )
  (aDay == 'Субота' or aDay == 'Неділя') ?
    daytype = 'вихідний' :
    daytype = 'будній'
  return daytype
end

x = 11
x == 10 ? puts("це 10") : puts("це якесь інше число")

day1 = "Понеділок"
day2 = "Субота"
print(day1 + " — це " + dayIs(day1) + "\n")
print(day2 + " — це " + dayIs(day2) + "\n")
