class AddCodeToDispatch < ActiveRecord::Migration
  def change
    add_column :dispatches, :code, :string
  end
end
