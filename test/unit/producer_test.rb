require 'test_helper'

class ProducerTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

  	#refute = Ensures that test is false.
	#assert = Ensures that test is true.

	test "Rut no vacio" do
		producer = Producer.new
		producer.rut = '17.501.528-0'
		producer.save
		assert producer.errors.size == 8
	end

end