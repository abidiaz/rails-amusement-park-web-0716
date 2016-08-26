class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :attractions, :users
  end
end
