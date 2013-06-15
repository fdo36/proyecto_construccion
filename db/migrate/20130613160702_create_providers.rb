class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :rut
      t.string :phone
      t.string :email
      t.string :address
      t.string :commune
      t.string :contacto
      t.boolean :active

      t.timestamps
    end
  end
end
