class AddColumnCountPropertyContactToUser < ActiveRecord::Migration
  def change
  	add_column :users, :count_property_contact, :integer, :default => 0 
  end
end