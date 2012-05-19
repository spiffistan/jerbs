class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :necessary_skills, :text, :null => true
    add_column :jobs, :desired_qualities, :text, :null => true
  end
end
