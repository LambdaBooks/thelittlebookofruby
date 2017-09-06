# Приклад програми від www.sapphiresteel.com

taxrate = 0.175
print "Введіть ціну (без податку): "
s = gets
subtotal = s.to_f
if (subtotal < 0.0) then
  subtotal = 0.0
end
tax = subtotal * taxrate
puts "Податок від $#{subtotal} буде $#{tax}, тому загальна сума буде $#{subtotal+tax}"
