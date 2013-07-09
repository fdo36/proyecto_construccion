class RemoveContactoToProvider < ActiveRecord::Migration
  def up
    remove_column :providers, :contacto
  end

  def down
    add_column :providers, :contacto, :string
  end
end
