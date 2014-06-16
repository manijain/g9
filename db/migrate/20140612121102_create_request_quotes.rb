class CreateRequestQuotes < ActiveRecord::Migration
  def change
    create_table :request_quotes do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.text :message

      t.timestamps
    end
  end
end
