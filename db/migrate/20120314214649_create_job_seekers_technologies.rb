class CreateJobSeekersTechnologies < ActiveRecord::Migration
  def up
    create_table "job_seekers_technologies", :id => false do |t|
      t.integer "job_seeker_id"
      t.integer "technology_id"
    end
  end

  def down
    drop_table "job_seekers_technologies"
  end
end
