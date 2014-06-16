class AddStatusToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :status, :string, :default => "Not sold"
  end
end
