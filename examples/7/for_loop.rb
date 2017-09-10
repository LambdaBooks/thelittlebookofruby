# Приклад програми від www.sapphiresteel.com

puts('--- цикл #1 ---')
for i in [1,2,3] do
  puts(i)
end

puts('--- цикл #3 ---')
# 'do' є необов’язковим для багаторядкового циклу for
for s in ['один', 'два', 'три'] #do
  puts(s)
end


puts('--- цикл #3 ---')
# 'do' обов’язковий, коли цикл for записаний одним рядком
for x in [1, "два", [3,4,5]] do puts(x) end
