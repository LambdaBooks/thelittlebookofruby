# Приклад програми від www.sapphiresteel.com

# створюємо маисв з двох підмасивів: наприклад, 2 'рядки' з двома елементам
multiarr = [['one','two','three','four'], # multiarr[0]
            [1,2,3,4]]                    # multiarr[1]

# ітеруємось по елементах ('рядках') з multiarr
puts( "for i in.. (багатовимірний масив)" )
for i in multiarr
	puts(i.inspect)
end

puts( "\nfor a, b, c, d in.. (багато вимірний масив)" )
for (a,b,c,d) in multiarr
	print("a=#{a}, b=#{b}, c=#{c}, d=#{d}\n" )
end
