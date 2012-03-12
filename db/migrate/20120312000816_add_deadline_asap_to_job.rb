class AddDeadlineAsapToJob < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.boolean :deadline_asap, :default => true
    end
  end
end
