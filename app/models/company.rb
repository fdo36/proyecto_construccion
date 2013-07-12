#encoding: utf-8
require 'astrotils'

class Company < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :rut, :presence => true
  validates :email, :presence => true
  validates_inclusion_of :system_type, :in => [true, false]
  
  after_save :create_roles

  validates :phone, :format => { :with => /^-?((?:\d+|\d*)$)/,
    :message => "debe ingresar un número válido" }
  
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => "debe seguir el formato ejemplo@midominio.com" }

 validates :rut, :format => { :with => /^(\d{1,3}.\d{3}.\d{3}-)([a-zA-Z]{1}$|\d{1}$)/,
    :message => "debe ingresar el formato válido. Ejemplo: 11.111.111-1" }
  
  attr_accessible :address, :commune_id, :email, :line_of_business, :name, :phone, :rut , :active, :region_id , :system_type
  
  has_many :users , :dependent => :destroy
  belongs_to :commune
  belongs_to :region
  has_many :receipts
  has_many :dispatches
  
  def create_roles
    models = Astrotils::get_models
    role = Role.new(:name => "Administador de Acopio", :description => "Usado para administar compañias de acopio")
    if self.system_type == true
      models.each { |model|
        membership = model.get_component_info[0] 
        if membership == :acopio or membership == :acopiopacking
          a=AccessRight.create(:model_name => model.model_name, :action => "manage", :company_id => self.id)
          role.access_rights << a
        end
      }
    else
      models.each { |model|
        membership = model.get_component_info[0] 
        if membership == :packing or membership == :acopiopacking
          a=AccessRight.create(:model_name => model.model_name, :action => "manage", :company_id => self.id)
          role.access_rights << a
        end
      }
    end
    role.company_id = self.id
    role.save
  end
end
