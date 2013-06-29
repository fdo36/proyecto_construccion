class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.integer :code
      t.string :rut
      t.string :company_name
      t.integer :commune_id
      t.string :address
      t.string :email
      t.string :phone
      t.text :contact
      t.boolean :active
      t.foreign_key :communes

      t.timestamps
    end
  end
end
