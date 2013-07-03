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
end
