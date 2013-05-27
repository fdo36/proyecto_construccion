class CreatePackGroupDispatches < ActiveRecord::Migration
  def change
    create_table :pack_group_dispatches do |t|
      t.integer :gross_weight
      t.integer :quantity
      t.integer :quality_id
      t.integer :variety_id
      t.integer :dispatch_id
      t.integer :pack_type_id
      t.integer :company_id

      t.timestamps
    end
  end
end
