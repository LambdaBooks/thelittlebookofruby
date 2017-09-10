# Приклад програми від www.sapphiresteel.com

x = 1
## Багаторядковий запис...
if x == 1 then # з 'then'
  puts('ok')
end

if x == 1      # без 'then'
  puts('ok')
end

if x == 1 :    # з двокрапкою
  puts('ok')
end

## Однорядковий запис...
if x == 1 then puts('ok') end    # з 'then'
if x == 1 : puts('ok') end       # з двокрапкою
if x == 1 puts('ok') end         # синтаксична помилка!
