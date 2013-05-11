class AddPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :integer
    add_column :users, :active, :boolean
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :boolean
    add_column :users, :secret_question, :string
    add_column :users, :secret_answer, :string
  end
end
