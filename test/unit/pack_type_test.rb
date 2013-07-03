require 'test_helper'

class PackTypeTest < ActiveSupport::TestCase

  #Campos vacios
  test "Tipo Envase verificacion de todos sus campos" do
  	pack_type = PackType.new
  	pack_type.save
	assert pack_type.errors.size == 3 		
  end

  #Campos llenos
  test "Tipo Envase sin tara" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.company_id = 1
  	refute pack_type.save
  end

  #nombre
  test "Tipo Envase sin nombre" do
  	pack_type = PackType.new
  	pack_type.tare = 1
  	pack_type.company_id = 1
  	refute pack_type.save
  end

  #tara
  test "Tipo Envase sin tara" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.company_id = 1
  	refute pack_type.save
  end

  #company_id
  test "Tipo Envase sin compania" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 1
  	refute pack_type.save
  end


  test "Tipo Envase tara es numerico" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 1
  	pack_type.company_id = 1
  	assert pack_type.save
  end

  test "Tipo Envase tara no es numerico" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 'a'
  	pack_type.company_id = 1
  	assert pack_type.errors.size == 1
  end

  test "Tipo Envase tara puede ser flotante" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 0.25
  	pack_type.company_id = 1
  	assert pack_type.save
  end

end
