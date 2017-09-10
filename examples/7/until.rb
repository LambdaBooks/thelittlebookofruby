# Приклад програми від www.sapphiresteel.com

i = 10
# однорядковий until
puts("until 1")
until i == 10 do puts(i) end    # ніколи не виконається

# багаторядковий until, в якому ключове слово do необов’язкове
puts("\nuntil 2")
until i == 10 # do              # ніколи не виконається
  puts(i)
  i += 1
end

# однорядковий модифікатор until
puts("\nuntil 3")
puts(i) until i == 10           # ніколи не виконається

# багаторядковий модифікатор until, виконається 1 або більше разів
puts("\nuntil 4")
begin                           # виконається один раз
  puts(i)
end until i == 10
