class AddRolableToUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.references :rolable, :polymorphic => true
    end
  end
  def down
    change_table :users do |t|
      t.remove :rolable
    end
  end
end
