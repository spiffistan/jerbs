class AddPercentageToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :percentage, :integer
  end
end
