class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :rut
      t.string :code
      t.string :line_of_business
      t.string :address
      t.string :location
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
