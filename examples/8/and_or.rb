# Приклад програми від www.sapphiresteel.com

def dayIs(aDay)
  working_overtime = true
  if aDay == 'Субота' or aDay == 'Наділя' and not working_overtime
    daytype = 'свято'
    puts("Уурраа!")
  else
    daytype = 'робочий день'
  end
  return daytype
end

day1 = "Понеділок"
day2 = "Субота"
print(day1 + " — це " + dayIs(day1) + "\n")
print(day2 + " — це " + dayIs(day2) + "\n")
