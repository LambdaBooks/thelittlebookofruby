# Приклад програми від www.sapphiresteel.com

def hello
	return "привіт світ"
end

x = [1+2, hello, `dir`] # масив містить вираз, виклик методу та рядок
puts(x.inspect) # Зауважте: якщо ви не використовуєте Windows, вам напевно
                # потрібно буде  замінити `dir` командою, яку розуміє
                # ваша операційна система

y = %w(це масив з рядків)
puts(y.inspect)

a = Array.new
puts("Array.new : " << a.inspect)

a = Array.new(2)
puts("Array.new(2) : " << a.inspect)

a = Array.new(2, "привіт світ")
puts(a.inspect)

a = Array.new(2)
a[0]= Array.new(2,'привіт')
a[1]= Array.new(2,'світ')
puts(a.inspect)

a = [ [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16] ]
puts(a.inspect)

a = Array.new([1,2,3])
puts(a.inspect)

# Зауважте: у прикладі вище, якщо ви передали масив у new() без
# дужок, вам потрібно вставити пробіл між 'new' та відкриваючими
# квадратними дужками.
# Це працює:
#   a = Array.new [1,2,3]
# А це ні!
#   a = Array.new[1,2,3]
