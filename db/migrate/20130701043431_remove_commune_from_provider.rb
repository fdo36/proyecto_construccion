class RemoveCommuneFromProvider < ActiveRecord::Migration
  def up
    remove_column :providers, :commune
  end

  def down
    add_column :providers, :commune, :string
  end
end
