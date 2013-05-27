class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false, :default => ""
      t.integer :rut , :null => false , :unique => true
      t.string :address
      t.string :city
      t.string :line_of_business
      t.integer :phone, :unique => true
      t.string :email, :null => false, :default => "" , :unique => true

      t.timestamps
    end
  end
end
