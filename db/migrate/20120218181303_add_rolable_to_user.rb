class AddRolableToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :rolable, :polymorphic => true
    end
  end
end
