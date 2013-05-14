class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false, :default => ""
      t.integer :rut , :null => false
      t.string :address
      t.string :city
      t.string :line_of_business
      t.integer :phone
      t.string :email, :null => false, :default => ""

      t.timestamps
    end
  end
end
