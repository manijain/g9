class ChangeNumberFormatInRequestQuotes < ActiveRecord::Migration
  def change
  	change_column :request_quotes, :phone, :string
  end
end