class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :name
      t.string :url
      t.references :location

      t.timestamps
    end
    add_index :user_profiles, :user_id
    add_index :user_profiles, :location_id
  end
end
