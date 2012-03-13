class AddLogoToEmployer < ActiveRecord::Migration
  def up
    change_table :employers do |t|
      t.has_attached_file :logo
    end
  end

  def down
    drop_attached_file :employers, :logo
  end
end
