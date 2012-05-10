class AddLocatableToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :locatable_id, :integer
    add_column :locations, :locatable_type, :string
  end
end
