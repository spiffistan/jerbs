class CreateJobsTechnologiesJoinTable < ActiveRecord::Migration
  def up
    create_table :jobs_technologies, :id => false do |t|
      t.references :job, :technology
    end
  end

  def down
    drop_table :jobs_technologies
  end
end
