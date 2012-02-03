class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.text :address 
      t.references :location

      t.timestamps
    end
    add_index :companies, :location_id
  end
end
