class RemoveCodeFromReceipt < ActiveRecord::Migration
  def up
    remove_column :receipts, :code
  end

  def down
    add_column :receipts, :code, :string
  end
end
