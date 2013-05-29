class FixCompanyName < ActiveRecord::Migration
  def change
    rename_column :producers, :company_name, :name
  end
end
