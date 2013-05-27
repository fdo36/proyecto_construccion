class CreatePackTypes < ActiveRecord::Migration
  def change
    create_table :pack_types do |t|
      t.string :name
      t.integer :tare
      t.integer :company_id

      t.timestamps
    end
  end
end
