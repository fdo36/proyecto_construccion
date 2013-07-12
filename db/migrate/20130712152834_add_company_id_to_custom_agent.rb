class AddCompanyIdToCustomAgent < ActiveRecord::Migration
  def change
    add_column :custom_agents, :company_id, :integer
  end
end
