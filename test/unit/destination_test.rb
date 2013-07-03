require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
	#test "the truth" do
    #	assert true
   	#end
	
	test "Destino sin nombre con rut" do
  		destination = Destination.new
  		destination.rut = '16.726.966-4'
  		refute destination.save
	end

	test "Destino con nombre con rut" do
  		destination = Destination.new
  		destination.rut = '16.726.966-4'
  		destination.name = 'Nombre'
  		refute destination.save
	end
end
