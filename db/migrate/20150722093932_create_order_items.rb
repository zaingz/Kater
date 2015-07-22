class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.integer :quantity
      t.references :order
      t.timestamps null: false
    end
  end
end
