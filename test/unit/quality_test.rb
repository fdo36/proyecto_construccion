require 'test_helper'

class QualityTest < ActiveSupport::TestCase
	test "should not save post without data" do
	  post = Quality.new
	  assert !post.save, "Guarda Calidad sin datos"
	end

	test "should save post with all data" do
	  post = Quality.new
	  assert !post.save
	end
end
