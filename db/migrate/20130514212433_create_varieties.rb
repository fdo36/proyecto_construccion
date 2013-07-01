class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name
      t.integer :kind_id
      t.foreign_key :kinds
      
      t.timestamps
    end
  end
end
