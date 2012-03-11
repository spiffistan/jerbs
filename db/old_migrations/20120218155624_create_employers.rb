class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.string :position
      t.references :company

      t.timestamps
    end
  end
end
