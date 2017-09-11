# Приклад програми від www.sapphiresteel.com

module MagicThing
	def m_power
		return @power
	end

	def m_power=(aPower)
		@m_power=aPower
	end
end

module Treasure
	attr_accessor :value
	attr_accessor :insurance_cost
end

class Weapon
	attr_accessor :deadliness
	attr_accessor :power
end

class Sword < Weapon
  include Treasure
  include MagicThing

  attr_accessor :name
end

s = Sword.new
s.name = "Excalibur"
s.deadliness = 10
s.power = 20
s.m_power = "Glows when Orcs Appear"

puts(s.name)
puts(s.deadliness)
puts(s.power)
puts(s.m_power)
