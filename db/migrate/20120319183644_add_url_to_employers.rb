class AddUrlToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :url, :string
  end
end
