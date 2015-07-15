class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|

      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.float :price, null: false


      t.timestamps null: false
    end
  end
end
