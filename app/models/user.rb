class User < ActiveRecord::Base
  ROLES = %w[superadmin admin packing_user acopio_user]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD


  validates :secret_answer, :presence => true
  validates :secret_question, :presence => true

=======
>>>>>>> 5a61a1a5363f9365b7778766f8f78fb36b94e154
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :company_id, :password_confirmation, :remember_me, :gender, :phone, :active, :name, :lastname, :secret_answer, :secret_question, :super_admin

  has_and_belongs_to_many :roles
<<<<<<< HEAD
  belongs_to :company
=======
  
 
>>>>>>> 5a61a1a5363f9365b7778766f8f78fb36b94e154

  def super_admin?
    self.super_admin
  end

  def active?
      active
  end
end
