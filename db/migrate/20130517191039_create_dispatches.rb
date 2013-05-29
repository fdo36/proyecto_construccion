class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.string :code
      t.integer :destination_id
      t.foreign_key :destinations
      t.integer :kind_id
      t.foreign_key :kinds
      t.datetime :dispatch_datetime
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
