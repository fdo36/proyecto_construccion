class AddCommuneIdToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :commune_id, :integer
  end
end
