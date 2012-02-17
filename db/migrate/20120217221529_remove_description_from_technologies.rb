class RemoveDescriptionFromTechnologies < ActiveRecord::Migration
  def up
    remove_column :technologies, :description
  end

  def down
    add_column :technologies, :description, :string
  end
end
