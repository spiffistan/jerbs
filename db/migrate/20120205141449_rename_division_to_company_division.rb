class RenameDivisionToCompanyDivision < ActiveRecord::Migration
  def change
    rename_table :divisions, :company_divisions
  end
end
