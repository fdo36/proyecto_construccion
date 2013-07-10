require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
	#test "the truth" do
    #	assert true
   	#end

	test "Destino verificacion de todos sus campos" do
  		destination = Destination.new
  		destination.rut = '16.726.966-4'
  		destination.save
  		assert destination.errors.size == 6
	end

	test "Destino verificacion de formato email correcto" do
		destination = Destination.new
		destination.rut = '16.726.966-4'
		destination.email = 'cristorb@gmail.com'
		destination.name = 'nombreDestino'
		destination.code = 123
		destination.commune_id = 1
		destination.address = '12 Sur'
		destination.phone = '+56990862788'
		destination.contact = 'juan perez'
		assert destination.save
	end

	test "Destino verificacion de formato email incorrecto" do
		destination = Destination.new
		destination.rut = '16.726.966-4'
		destination.email = 'cristorb'
		destination.name = 'nombreDestino'
		destination.code = 123
		destination.commune_id = 1
		destination.address = '12 Sur'
		destination.phone = '+56990862788'
		destination.contact = 'juan perez'
		refute destination.save
	end

end
