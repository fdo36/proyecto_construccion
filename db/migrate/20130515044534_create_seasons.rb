class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :init_date
      t.date :end_date
      t.integer :kind_id
      t.foreign_key :kinds
      t.integer :is_active
      t.integer :is_delete

      t.timestamps
    end
  end
end
