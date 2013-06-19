#encoding: utf-8
class RutValidator < ActiveModel::Validator
  def validate(record)
    if record.rut.empty?
      record.errors[:base] << "Debe ingresar un RUT"
    else
    	invalid = true
    	t = (record.rut[0, record.rut.length - 2].delete(".")).to_i
    	d = record.rut[record.rut.length - 1, record.rut.length]
      v=1
  	  s=0
      for i in (2..9)
    	  if i == 8
    	    v=2
    	  else 
    	  	v+=1
    	  end
        s+=v*(t%10)
    	  t/=10
  	  end
  	  s = 11 - s%11
  	  if s == 11
  	    if d.to_i == 0
  	  	  invalid = false
  	    end
  	  elsif s == 10
  	    if d.casecmp("K") == 0
  	  	  invalid = false
  	    end
  	  else
  	    if d.to_i == s
  	  	  invalid = false
  	    end	
  	  end

      if invalid == true
        record.errors[:base] << "el RUT es inválido"
      end
    end
  end
end

class ValidatorProducerRutAlreadySaved < ActiveModel::Validator
  def validate(record)
  	producer = Producer.where(:rut => record.rut)
  	if !producer.empty?
  		record.errors[:base] << "ya existe un productor con el RUT indicado."
  	end
  end
end

class ValidatorDestinationRutAlreadySaved < ActiveModel::Validator
  def validate(record)
  	destination = Destination.where(:rut => record.rut)
  	if !destination.empty?  and !@editing
  		record.errors[:base] << "ya existe un destino con el RUT indicado."
  	end
  end
end