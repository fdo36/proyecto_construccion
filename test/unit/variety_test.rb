require 'test_helper'

class VarietyTest < ActiveSupport::TestCase
   # test "the truth" do
   #   assert true
   # end
	test "Variedad sin nombre y sin Especie" do
  		variety = Variety.new
  		refute variety.save
	end

	test "Variedad con nombre y sin Especie" do
  		variety = Variety.new
  		variety.name = 'Variedad 1'
  		refute variety.save
	end

	test "Variedad con nombre y con Especie" do
  		variety = Variety.new
  		variety.name = 'Variedad 1'
  		variety.kind_id = 2
  		assert variety.save
	end

	test "Variedad sin nombre y con Especie" do
  		variety = Variety.new
  		variety.kind_id = 2
  		refute variety.save
	end

	test "Variedad verificacion de todos sus campos" do
		variety = Variety.new
		variety.save
		assert variety.errors.size == 2
	end
	
end
