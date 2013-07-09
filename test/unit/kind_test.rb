require 'test_helper'

class KindTest < ActiveSupport::TestCase
	#test "the truth" do
	#  assert 
	#end

	#refute = Ensures that test is false.
	#assert = Ensures that test is true.

	test "Kind sin nombre " do
		kind = Kind.new
		refute kind.save
	end

	test "Kind con nombre " do
		kind = Kind.new
		kind.name = 'Kind 1'
		assert kind.save
	end

end
