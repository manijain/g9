class AddColumnCountPropertyToUser < ActiveRecord::Migration
  def change
  	add_column :users, :count_property, :integer, :default => 0
  end
end
