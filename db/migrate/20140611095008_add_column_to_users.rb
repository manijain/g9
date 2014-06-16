class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :gender, :string
  	add_column :users, :address, :text
  	add_column :users, :city, :string
  	add_column :users, :phone, :string
  	add_column :users, :occupation, :string
  	add_column :users, :is_admin, :boolean, :default => false
  end
end