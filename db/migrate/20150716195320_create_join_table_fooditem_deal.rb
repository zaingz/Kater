class CreateJoinTableFooditemDeal < ActiveRecord::Migration
  def change
    create_join_table :food_itemsoodItems, :deals do |t|
      # t.index [:food_item_id, :deal_id]
      # t.index [:deal_id, :food_item_id]
    end
  end
end
