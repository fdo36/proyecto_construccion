class Role < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  attr_accessible :description, :name
  has_and_belongs_to_many :users
  has_many :access_rights
end
