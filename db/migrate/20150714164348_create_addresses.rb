class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :full_name, null: false, default: ""
      t.string :street_address, null: false, default: ""
      t.string :city, null: false, default: "", limit:25
      t.string :state,  null: false, default: "",limit:25
      t.string :country,  null: false, default: "",limit:25
      t.integer :zip_code, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end
