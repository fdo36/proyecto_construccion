#encoding: utf-8
class RutValidator < ActiveModel::Validator
  def validate(record)
  	invalid = true
  	t = record.rut[0, record.rut.length - 2].to_i
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
      record.errors[:base] << "El RUT es inválido"
    end
   
    @producer = Producer.where(:rut => record.rut)
    @destination = Destination.where(:rut => record.rut)
    if !@producer.empty? or !@destination.empty?
    	record.errors[:base] << "El RUT ya ha sido ingresado"
    end


  end
end