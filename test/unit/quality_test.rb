require 'test_helper'

class QualityTest < ActiveSupport::TestCase
	test "no debe guardar calidad sin datos" do
	  post = Quality.new
	  assert !post.save, "Guarda Calidad sin datos"
	end

	test "guarda calidad con datos validos" do
	  post = Quality.new
	  post.
	  assert !post.save
	end
end
