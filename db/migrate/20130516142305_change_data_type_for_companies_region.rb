class ChangeDataTypeForCompaniesRegion < ActiveRecord::Migration
def self.up
    change_table :companies do |t|
      t.change :region, :integer
    end
  end
 
  def self.down
    change_table :companies do |t|
      t.change :region, :string
    end
  end
end