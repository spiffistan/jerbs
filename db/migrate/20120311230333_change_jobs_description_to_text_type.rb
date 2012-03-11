class ChangeJobsDescriptionToTextType < ActiveRecord::Migration
  def up
    change_table :jobs do |t|
      t.change :description, :text
    end
  end
  def down
    change_table :jobs do |t|
      t.change :description, :string
    end
  end
end
