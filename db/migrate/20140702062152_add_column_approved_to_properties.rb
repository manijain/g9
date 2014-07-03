class AddColumnApprovedToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :is_approved, :boolean, :default => false
  end
end