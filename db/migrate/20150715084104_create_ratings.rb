class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.string :tittle, null: false, default: ""
      t.text :description, null: false, default: ""
      t.integer :food, null: false, default: 0
      t.integer :service, null: false, default: 0
      t.integer :ambience, null: false, default: 0
      t.integer :value, null: false, default: 0


      t.references :user
      t.references :catering_company


      t.timestamps null: false
    end
  end
end
