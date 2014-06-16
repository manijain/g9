class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :title
    	t.text :description
    	t.string :location
    	t.integer :approx_prize
    	t.string :approx_sale_duration

    	t.timestamps
    end
  end
end