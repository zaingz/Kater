class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :full_name, null: false, default: ""
      t.string :street_address, null: false, default: ""
      t.string :street_address_opt, null: true, default: ""
      t.string :mobile_number1, null: false, default: ""
      t.string :mobile_number2, null: true, default: ""
      t.string :email, null: true, default: ""
      t.string :city, null: false, default: "", limit:25
      t.string :country,  null: true, default: "Kuwait",limit:25      
      t.references :user
      t.timestamps null: false
    end
  end
end
