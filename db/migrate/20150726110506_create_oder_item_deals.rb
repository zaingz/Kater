class CreateOderItemDeals < ActiveRecord::Migration
  def change
    create_table :oder_item_deals do |t|
    	t.belongs_to :order_item
    	t.belongs_to :deal
    	t.integer :quanitiy, default: 1
      	t.timestamps null: false
    end
  end
end
