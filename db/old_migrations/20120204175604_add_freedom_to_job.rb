class AddFreedomToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :freedom, :float

  end
end
