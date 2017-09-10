# Приклад програми від www.sapphiresteel.com

def dayIs(aDay)
  if aDay == 'Субота' or aDay == 'Неділя'
    daytype = 'вихідний'
  else
    daytype = 'будень'
  end
  return daytype
end

day1 = "Понеділок"
day2 = "Неділя"
print(day1 + " — це " + dayIs(day1) + "\n")
print(day2 + " — це " + dayIs(day2) + "\n")
