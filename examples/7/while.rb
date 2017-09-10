# Приклад програми від www.sapphiresteel.com

$hours_asleep = 0 # змінні, що починаються з $ є глобальними

def tired
  if $hours_asleep >= 8 then
    $hours_asleep = 0
    return false
  else
    $hours_asleep += 1
    return true
  end
end

def snore
  puts('храп....')
end

def sleep
  puts("z" * $hours_asleep)
end

while tired do sleep
end
puts("Я прокинувся і готовий зустріти день!")

while tired
  sleep
end
puts("Я прокинувся і готовий зустріти 2-й день!")

sleep while tired
puts("Я прокинувся і готовий зустріти 3-й день!")

begin
  sleep
  snore
end while tired
puts("Я прокинувся і готовий зустріти 4-й день!")
