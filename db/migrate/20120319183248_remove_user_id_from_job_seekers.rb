class RemoveUserIdFromJobSeekers < ActiveRecord::Migration
  def up
    remove_column :job_seekers, :user_id
  end

  def down
    add_column :job_seekers, :user_id, :integer
  end
end
