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

showstring
showname("Сергій")
puts(return_name("Марія", "Іванівна"))
puts(return_name("Денис", "Володимирович"))
