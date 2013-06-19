class RemovePhoneFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :phone
  end

  def down
    add_column :companies, :phone, :integer
  end
end
