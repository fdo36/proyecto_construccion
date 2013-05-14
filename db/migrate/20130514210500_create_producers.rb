class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :rut
      t.string :company_name
      t.string :line_of_business
      t.integer :commune_id
      t.string :address
      t.string :email
      t.string :phone
      t.text :contact
      t.string :sag_code
      t.boolean :active
      t.foreign_key :communes

      t.timestamps
    end
  end
end
