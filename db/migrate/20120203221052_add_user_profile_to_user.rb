class AddUserProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_profile_id, :integer
    add_index :users, :user_profile_id
  end
end
