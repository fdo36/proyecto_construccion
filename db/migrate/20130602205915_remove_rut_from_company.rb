class RemoveRutFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :rut
  end

  def down
    add_column :companies, :rut, :integer
  end
end
