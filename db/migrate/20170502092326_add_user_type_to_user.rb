class AddUserTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_category, :string
  end
end
