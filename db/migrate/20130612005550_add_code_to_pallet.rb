class AddCodeToPallet < ActiveRecord::Migration
  def change
    add_column :pallets, :code, :string
  end
end
