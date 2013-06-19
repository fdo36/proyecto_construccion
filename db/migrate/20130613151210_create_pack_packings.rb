class CreatePackPackings < ActiveRecord::Migration
  def change
    create_table :pack_packings do |t|
      t.string :name

      t.timestamps
    end
  end
end
