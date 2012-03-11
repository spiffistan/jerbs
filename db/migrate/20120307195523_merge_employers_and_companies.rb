class MergeEmployersAndCompanies < ActiveRecord::Migration
  def up
    change_table :employers do |t|
      t.string :company_name
      t.string :company_description
      t.text :company_address
      t.references :location
    end
    add_column :jobs,  :employer_id, :integer
    add_index :jobs, :employer_id
  end

  def down
  end
end
