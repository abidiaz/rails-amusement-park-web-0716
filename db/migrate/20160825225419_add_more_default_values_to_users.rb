class AddMoreDefaultValuesToUsers < ActiveRecord::Migration
  def change
    change_column :users, :height, :integer, default: 5
    change_column :users, :tickets, :integer, default: 5
  end
end
