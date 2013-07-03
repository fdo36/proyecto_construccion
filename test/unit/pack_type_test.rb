require 'test_helper'

class PackTypeTest < ActiveSupport::TestCase

  #Campos vacios
  test "Verifica presencia de campos obligatorios" do #OK
  	pack_type = PackType.new
  	pack_type.save
	assert !pack_type.save 		
  end

  #Campos llenos
  test "Agrega un envase con campos correctos" do #OK
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 0.2
  	pack_type.company_id = 1
  	assert pack_type.save
  end

  #nombre
  test "No agrega envase sin nombre" do #OK
  	pack_type = PackType.new
  	pack_type.tare = 1
  	pack_type.company_id = 1
  	refute pack_type.save
  end

  #tara
  test "No agrega envase sin tara" do #OK
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.company_id = 1
  	refute pack_type.save
  end

  #company_id
  test "Agrega compania en controlador" do #OK
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 1
  	assert pack_type.save
  end


  test "Tara es numerico" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 'a'
  	pack_type.company_id = 1
  	assert !pack_type.save
  end

  test "Tara es flotante" do  #OK
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 0.25
  	pack_type.company_id = 1
  	assert pack_type.save
  end

  test "Tara no es negativo" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = -0.25
  	pack_type.company_id = 1
  	refute pack_type.save, "Tara no puede ser negativo"
  end

  test "Tara no es cero" do
  	pack_type = PackType.new
  	pack_type.name = 'Envase 1'
  	pack_type.tare = 0
  	pack_type.company_id = 1
  	assert !pack_type.save, "Tara no puede ser cero"
  end

end
