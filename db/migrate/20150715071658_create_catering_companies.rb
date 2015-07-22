class CreateCateringCompanies < ActiveRecord::Migration
  def change
    create_table :catering_companies do |t|

      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.integer :number_of_employes, null: false, default: 1
      t.integer :discount
      t.boolean :female_servers , null: false, default: false
      t.boolean :arabic_speaking , null: false, default: false
      t.integer :sitting_capacity,  null: false, default: 1
      t.string :contact_number, null: false
      t.string :address, null: false, default: 1
      t.string :city, null: false, default: "", limit:25
      t.string :state,  null: false, default: "",limit:25
      t.string :country,  null: false, default: "",limit:25
      t.references :user

      t.timestamps null: false
    end
  end
end
