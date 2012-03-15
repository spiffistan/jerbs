class AddSlugToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :slug, :string
    add_index :employers, :slug, unique: true
  end
end
