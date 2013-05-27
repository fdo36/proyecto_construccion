class CreateDispatches < ActiveRecord::Migration
  def change
    create_table :dispatches do |t|
      t.integer :destination_id
      t.integer :kind_id
      t.datetime :dispatch_datetime
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
