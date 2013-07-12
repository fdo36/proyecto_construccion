class AddSystemTypeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :system_type, :boolean
  end
end
