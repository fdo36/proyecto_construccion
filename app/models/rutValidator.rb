#encoding: utf-8
class RutValidator < ActiveModel::Validator
  def validate(record)
  	invalid = false
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
	  if d.to_i != 0
	  	invalid = true
	  end
	elsif s == 10
	  if d != "K" || d != "k"
	  	invalid = true
	  end
	else
	  if d.to_i != s
	  	invalid = true
	  end	
	end

    if invalid == true
      record.errors[:base] << "El RUT es inválido"
    end
  end
end