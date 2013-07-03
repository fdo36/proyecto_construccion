require 'test_helper'

class GroupingTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	#refute = Ensures that test is false.
	#assert = Ensures that test is true.

	test "Grouping sin nombre y sin descripcion" do
		grouping = Grouping.new
		refute grouping.save
	end

	test "Grouping sin nombre y con descripcion" do
		grouping = Grouping.new
		grouping.description = 'Descripcion 1'
		refute grouping.save
	end

	test "Grouping con nombre y sin descripcion" do
		grouping = Grouping.new
		grouping.name = 'Nombre 1'
		refute grouping.save
	end

	test "Grouping con nombre y con descripcion" do
		grouping = Grouping.new
		grouping.name = 'Nombre 1'
		grouping.description = 'Descripcion 1'
		assert grouping.save
	end
end