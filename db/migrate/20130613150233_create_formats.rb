class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :name
      t.integer :quantity
      t.float :weight

      t.timestamps
    end
  end
end
