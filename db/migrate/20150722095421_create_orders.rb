class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|


      t.text :request_message
      t.boolean :completed
      t.references :user
      t.references :catering_company


      t.timestamps null: false
    end
  end
end
