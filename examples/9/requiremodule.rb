# Приклад програми від www.sapphiresteel.com

require("testmod.rb")

puts("  MyModule.greet")
puts(MyModule.greet)
puts("  MyModule::GOODMOOD")
puts(MyModule::GOODMOOD)
# puts(greet) #=> Це не спрацює!

include MyModule # примішуємо MyModule
puts("  greet")
puts(greet)	#=> Проте тепер це працюватиме!
puts("  sayHi")
puts(sayHi)
puts("  sayHiAgain")
puts(sayHiAgain)
sing
puts(12346)
