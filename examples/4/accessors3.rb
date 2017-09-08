# Приклад програми від www.sapphiresteel.com
# більше про читання та запис атрибутів

class Thing
  attr_reader :name, :description
  attr_writer(:name, :description)
  attr_accessor(:value, :id, :owner)
end

t = Thing.new
t.name = "Річ"
t.description = "м’яка та пухнаста"
t.value = 100
t.id = "TH100SFW"
t.owner = "я"
puts("Це #{t.name} і вона #{t.description}, вона коштує $#(t.value)")
puts("Її ідентифікатор #{t.id}. Її власник це #{t.owner}.")
