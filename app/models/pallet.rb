class MyValidator < ActiveModel::Validator
  def validate(pallet)
    r = Pallet.where(:code => pallet.code)
    if !r.empty?
      p = r.first
      if p.variety_id != pallet.variety_id
        pallet.errors[:variety_id] << " debe ser <"+ (Variety.all(:select => "name", :conditions => ["id = ?", p.variety_id]))[0].name+">. El pallet <" + p.code.to_s + "> fue registrado anteriormente"
      end
      if p.quality_id != pallet.quality_id
        pallet.errors[:quality_id] << " debe ser <"+ (Quality.all(:select => "name", :conditions => ["id = ?", p.quality_id]))[0].name+">. El pallet <" + p.code.to_s + "> fue registrado anteriormente" 
      end
      if p.pack_type_id != pallet.pack_type_id
        pallet.errors[:pack_type_id] << "debe ser <"+ (PackType.all(:select => "name", :conditions => ["id = ?", p.pack_type_id]))[0].name+">. El pallet <" + pallet.code.to_s + "> fue registrado anteriormente"
      end
    end
    
  end
end


class Pallet < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  attr_accessible :code, :company_id, :dispatch_id, :gross_weight, :pack_type_id, :price_per_unit, :quality_id, :quantity, :receipt_id, :tare, :variety_id
  belongs_to :variety
  belongs_to :quality
  belongs_to :receipt
  belongs_to :pack_type
  belongs_to :company
  belongs_to :dispatch

  
  validates :gross_weight, :tare, :presence =>true, :numericality => true
  validates :variety_id,:quality_id,:price_per_unit,:pack_type_id, :quantity, :code, :receipt_id, 
   :presence => true, :numericality => { :only_integer => true }

end
