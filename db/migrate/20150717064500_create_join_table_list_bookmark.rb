class CreateJoinTableListBookmark < ActiveRecord::Migration
  def change
    create_table :deals_food_items, :id => false do |t|
      t.integer :food_item_id
      t.integer :deal_id
    end
  end
end
