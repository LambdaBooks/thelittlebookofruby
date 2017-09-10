# Приклад програми від www.sapphiresteel.com

# Тут unless еквівалентний до...
# if !(aDay == 'Субота' or aDay == 'Неділя')
def dayIs(aDay)
  unless aDay == 'Субота' or aDay == 'Неділя'
    daytype = 'вихідний'
  else
    daytype = 'будень'
  end
  return daytype
end

day1 = "Понеділок"
day2 = "Субота"
print(day1 + " — це" + dayIs(day1) + "\n")
print(day2 + " — це" + dayIs(day2) + "\n")
