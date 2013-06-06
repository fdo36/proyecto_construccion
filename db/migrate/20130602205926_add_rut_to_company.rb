class AddRutToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :rut, :string
  end
end
