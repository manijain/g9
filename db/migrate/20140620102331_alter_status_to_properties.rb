class AlterStatusToProperties < ActiveRecord::Migration
  def change
  	change_column :properties, :status, :string, :default => "Not sold"
  end
end