class AddShortnameToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :shortname, :string

  end
end
