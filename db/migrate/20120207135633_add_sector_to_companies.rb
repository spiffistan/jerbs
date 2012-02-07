class AddSectorToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :sector, :integer
  end
end
