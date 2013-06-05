class User < ActiveRecord::Base
  ROLES = %w[superadmin admin packing_user acopio_user]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :company_id, :password_confirmation, :remember_me, :gender, :phone, :active, :name, :lastname, :secret_answer, :secret_question, :super_admin
  attr_accessible :region_id, :commune_id, :address

  validates :name, :presence => true
  validates :lastname, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true


  has_and_belongs_to_many :roles

  belongs_to :company
  has_many :dispatches
  has_many :receipts
  
 


  def super_admin?
    self.super_admin
  end

  def active?
      active
  end
end
