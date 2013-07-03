require 'test_helper'

class QualityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Calidad verificacion de todos sus campos" do
  	quality = Quality.new
  	quality.save
	assert quality.errors.size == 1  		
  end

  test "Calidad sin nombre" do
  	quality = Quality.new
  	refute quality.save
  end

  test "Calidad con nombre" do
  	quality = Quality.new
  	quality.name = 'Calidad 1'
  	assert quality.save
  end

  #test "Guarda Caracteres especiales" do
  	#quality = Quality.new
  	#quality.name = ("<b>!#$%&()*+,-.</b>01234567890}áéíóú~}{[]").to_s
  	#assert quality.save
  #end
end
