class AddColumnRoleIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :role_id, :integer, :default => 3 
  end
end