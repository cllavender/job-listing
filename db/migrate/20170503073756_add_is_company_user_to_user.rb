class AddIsCompanyUserToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_company_admin, :boolean, default: false
  end
end
