class DealsFoodJoinTable < ActiveRecord::Migration
  def self.up
    create_table :deals_food_items, :id => false do |t|
      t.integer :food_item_id
      t.integer :deal_id
    end

    add_index :deals_food_items, [:food_item_id, :deal_id]
  end

  def self.down
    drop_table :deals_food_items
  end
end
