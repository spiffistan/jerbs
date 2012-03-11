class RenameUserProfileToJobSeekers < ActiveRecord::Migration
  def change
    rename_table :user_profiles, :job_seekers
  end
end
