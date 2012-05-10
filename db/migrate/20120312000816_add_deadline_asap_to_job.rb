class AddDeadlineAsapToJob < ActiveRecord::Migration
  def change
      add_column :jobs, :deadline_asap, :boolean, :default => true
  end
end
