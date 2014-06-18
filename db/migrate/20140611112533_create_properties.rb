class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :title
    	t.text :description
    	t.string :location
    	t.integer :approx_price
    	t.string :approx_sale_duration
        t.string :status

    	t.timestamps
    end
  end
end