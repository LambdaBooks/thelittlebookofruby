# Приклад програми від www.sapphiresteel.com

def array_length(anArray)
	return anArray.length
end

a0 = [1,2,3,4,5]
a1 = [1,'two', 3.0, array_length(a0 )]

p(a0)
p(a1)
puts("Індекс елементу #0 в a1 — #{a1[0]}, елемент #3 — #{a1[3]}")
