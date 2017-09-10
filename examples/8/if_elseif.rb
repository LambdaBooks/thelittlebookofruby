# Приклад програми від www.sapphiresteel.com

input = ''
puts("Скільки ви хочете за годину роботи? ")
while input != 'q' do
  puts("Введіть число від 1 до 1000 (або 'q' для виходу)")
  print("?- ")
  input = gets().chomp()
  if input == 'q'
    puts("Бувай")
  elsif input.to_i > 800
    puts("Це зависокий рівень оплати!")
  elsif input.to_i <= 800
    puts("Це ми потягнемо")
  end
end
