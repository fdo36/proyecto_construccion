class FixDestination < ActiveRecord::Migration
  def change
    rename_column :destinations, :company_name, :name
  end
end
