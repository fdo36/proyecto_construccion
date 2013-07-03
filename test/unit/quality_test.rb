require 'test_helper'

class QualityTest < ActiveSupport::TestCase

  test "Valida campos obligatorios" do
  	quality = Quality.new
  	quality.save
	assert quality.errors.size == 1  		
  end

  test "Calidad no tiene nombre" do
  	quality = Quality.new
  	refute quality.save
  end

  test "Calidad tiene nombre" do
  	quality = Quality.new
  	quality.name = 'Calidad 1'
  	assert quality.save
  end


end
