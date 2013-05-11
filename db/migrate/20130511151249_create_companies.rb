class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :rut
      t.string :address
      t.string :city
      t.string :line_of_business
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
