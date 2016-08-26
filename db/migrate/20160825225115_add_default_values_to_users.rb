class AddDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :nausea, :integer, default: 1
    change_column :users, :happiness, :integer, default: 5
  end
end
