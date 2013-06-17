class CreateFormatPackings < ActiveRecord::Migration
  def change
    create_table :format_packings do |t|
      t.string :name
      t.integer :quantity
      t.float :weight

      t.timestamps
    end
  end
end
